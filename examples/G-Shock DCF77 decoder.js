include ("io.asc")
include ("math.asc")

// Time/Date decoder for DCF77 signal
// https://en.m.wikipedia.org/wiki/DCF77

// this array simulates the bit stream received
var input_bits= [
0,                  // 00:    Start of minute. Always 0.
0,0,0,0,0,0,0,0,0,  // 01-09: Civil warning
0,0,0,0,0,

0,                  // 15
0,                  // 16: Summer time annonuncement. It works with bits 17 and 18.
0,                  // 17: CEST active bit (UTC+1)
0,                  // 18: CET active bit (UTC+2)
0,                  // 19: Leap second announcement
1,                  // 20: Start of encoded time. Always 1.
  
// 21-27: minutes
1,                  // 21: +1 minutes
0,                  // 22: +2 minutes
0,                  // 23: +4 minutes
1,                  // 24: +8 minutes
1,                  // 25: +10 minutes
0,                  // 26: +20 minutes
1,                  // 27: +40 minutes
0,                  // 28: minutes even parity
  
// 29-34: hour
1,                  // 29: +1 hour
1,                  // 30: +2 hour
0,                  // 31: +4 hour
0,                  // 32: +8 hour
0,                  // 33: +10 hour
1,                  // 34: +20 hour
1,                  // 35: hour even parity

// 36-41: day of the month
1,                  // 36: +1 day
0,                  // 37: +2 day
0,                  // 38: +4 day
0,                  // 39: +8 day
1,                  // 40: +10 day
1,                  // 41: +20 day

// 42-44: day of the week
1,                  // 42: +1 day of the week
1,                  // 43: +2 day of the week
1,                  // 44: +4 day of the week

// 45-49: month number
0,                  // 45: +1 month
0,                  // 46: +2 month
1,                  // 47: +4 month
1,                  // 48: +8 month
0,                  // 49: +10 month
  
// 50-57: year within century
1,                  // 50: +1 year
0,                  // 51: +2 year
0,                  // 52: +4 year
1,                  // 53: +8 year
1,                  // 54: +10 year
0,                  // 55: +20 year
0,                  // 56: +40 year
1,                  // 57: +80 year
  
0,                  // 58: date even parity (36-57)
0,                  // 59: no AM modulation
0,                  // 60: very rare. Only used in case of leap second being inserted.  
]

var dow_str =["","Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
var month_str = ["","January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
const current_century=2000    // current century, as year is 2-digit only


var input_bits_pointer= 0      // pointer for input bit sequence array
var frame_store = Array(60)           // array to store 60 (or 61) input bits
var frame_store_pointer = 0    // pointer to store array
var minute_length =60          // minute lenght, needed for te lead second case (61 seconds)
var i=0
var send_bit=0
var valid_frame= true

var dec_hours=0                 // decoded hour
var dec_minutes=0              // decoded minutes
var dec_day=0                  // decoded day
var dec_dow=0                  // decoded dey of the week
var dec_month=0                // decoded month
var dec_year=0                 // decoded year
var parity_minutes=0           // even parity for minutes
var parity_hour=0              // even parity for hour
var parity_date=0              // even parity for date

// this function takes the full time frame and decodes it.
function decode_frame() {
  console.log ("Frame decoding...")
  
  // Hour decode
  dec_minutes= frame_store[21]*1+frame_store[22]*2+frame_store[23]*4+frame_store[24]*8+
               frame_store[25]*10+frame_store[26]*20+frame_store[27]*40
  dec_hours= frame_store[29]*1+frame_store[30]*2+frame_store[31]*4+frame_store[32]*8+
             frame_store[33]*10+frame_store[34]*20
  // Date decode
  dec_day= frame_store[36]*1+frame_store[37]*2+frame_store[38]*4+frame_store[39]*8+
           frame_store[40]*10+frame_store[41]*20
  dec_dow= frame_store[42]*1+frame_store[43]*2+frame_store[44]*4
  dec_month= frame_store[45]*1+frame_store[46]*2+frame_store[47]*4+frame_store[48]*8+
             frame_store[49]*10
  dec_year= current_century+frame_store[50]*1+frame_store[51]*2+frame_store[52]*4+
            frame_store[53]*8+frame_store[54]*10+frame_store[55]*20+frame_store[56]*40+
            frame_store[57]*80
  
  // Bits 15-19
  // Bit 15: antenna issue. No impact in decoding.
  // Bit 16: Summer time annonuncement. It works together with bits 17 and 18.
  if (frame_store[16] == 1) {
    console.log ("Summer time change announced.")
    // Bit 17: CEST active bit (UTC+1)
    if (frame_store[17] == 1) console.log ("CEST in effect.")
    // Bit 18: CET active bit (UTC+2)
    if (frame_store[18] == 1) console.log ("CET in effect.")
  }
  // Bit 19: Leap second announcement. Should remain active for 24 hours if leap second is happening.
  if (frame_store[19] == 1) console.log ("Leap second announced.")
  
  console.log ("Checking frame validity...")
  valid_frame = true
  // fixed bit validity checks
  if (frame_store[0] != 0) valid_frame = false
  if (frame_store[20] != 1) valid_frame = false
  
  // parity validity checks
      // minutes parity
      parity_minutes= frame_store[21]+frame_store[22]+frame_store[23]+frame_store[24]+frame_store[25]+frame_store[26]+frame_store[27]
      parity_minutes= parity_minutes % 2
      if (parity_minutes != frame_store[28]) {
        console.log ("Invalid minutes parity.")
        valid_frame=false
    }
      // hour parity
      parity_hour= frame_store[29]+frame_store[30]+frame_store[31]+frame_store[31]+frame_store[33]+frame_store[34]
      parity_hour= parity_hour % 2
      //console.log ("Minutes parity:",parity_minutes)
      if (parity_hour != frame_store[35]) {
        console.log ("Invalid hour parity.")
        valid_frame=false
      }
      // date parity
      parity_date= frame_store[36]+frame_store[37]+frame_store[38]+frame_store[39]+frame_store[40]+frame_store[41]+
                   frame_store[42]+frame_store[43]+frame_store[44]+frame_store[45]+frame_store[46]+frame_store[47]+
                   frame_store[48]+frame_store[49]+frame_store[50]+frame_store[51]+frame_store[52]+frame_store[53]+
                   frame_store[54]+frame_store[55]+frame_store[56]+frame_store[57]
      parity_date= parity_date % 2
      if (parity_date != frame_store[58]) {
        console.log ("Invalid date parity.")
        valid_frame=false
    }
  
  if (valid_frame){
    console.log ("Frame decoding successful.")
    console.log ("--------------------------------")
    console.log ("Time: ", dec_hours, ":", dec_minutes)
    console.log ("Date: ", dow_str[dec_dow],", ", dec_day, " ", month_str[dec_month], " ", dec_year)
    console.log ("--------------------------------")
  } 
  else {
    console.log ("Invalid frame. No time available.")
  }
}

// this function receives a bit from the input sequence and stores it in the frame array
// Once frame is complete, decoding is triggered
function receive_bit(r_bit) {
  frame_store[frame_store_pointer]= r_bit
  frame_store_pointer++
  if (frame_store_pointer == 60) {
    console.log ("Full frame received.")
    decode_frame ()
    frame_store_pointer = 0
  }
}

// Main program
console.log ("G-Shock Decoder (DCF77)")

// pass all bits in input sequence for procesing
if (frame_store[19]==1) minute_length=61
for (input_bits_pointer=0; input_bits_pointer<minute_length; input_bits_pointer++) {
  send_bit= input_bits[input_bits_pointer]
  receive_bit(send_bit)
  }
minute_length =60






