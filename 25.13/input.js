
include ("io.asc")
include ("math.asc")
include ("graph.asc")


const eS = 0x00;                                                         // Empty square
const wP = 0x05;                                                         // White pawn
const wN = 0x11;                                                         // White knight
const wB = 0x19;                                                         // White bishop
const wR = 0x29;                                                         // White rook
const wQ = 0x39;                                                         // White queen
const wK = 0x41;                                                         // White king
const bP = 0x07;                                                         // Black pawn
const bN = 0x13;                                                         // Black knight
const bB = 0x1B;                                                         // Black bishop
const bR = 0x2B;                                                         // Black rook
const bQ = 0x3B;                                                         // Black queen
const bK = 0x43;                                                         // Black king

// value to ascii
let pieces = {                                                           // Piece chars
  0x00: ' ',                                                        	 // Empty square
  0x07: 'p',                                                             // Black pawn
  0x13: 'n',                                                             // Black knight
  0x1B: 'b',                                                             // Black bishop
  0x2B: 'r',                                                             // Black rook
  0x3B: 'q',                                                             // Black queen
  0x43: 'k',                                                             // Black king
  0x05: 'P',                                                             // White pawn
  0x11: 'N',                                                             // White knight
  0x19: 'B',                                                             // White bishop
  0x29: 'R',                                                             // White rook
  0x39: 'Q',                                                             // White queen
  0x41: 'K'                                                              // White king
};

var board = [                                                            // Chess board representation
  bk, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank8 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank7 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank6 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank5 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank4 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank3 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,               // Rank2 + dummy squares
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0                // Rank1 + dummy squares
];

var vector_pointers = {                                                  // Move vector table pointers
  0x87: 0xFA,                                                            // Pawn moves address
  0x93: 0xF4,                                                            // Knight moves address
  0x9B: 0xFB,                                                            // Bishop moves address
  0xAB: 0xF1,                                                            // Rook moves address
  0xBB: 0xF9,                                                            // Queen moves address
  0xC3: 0xF9                                                             // King Moves address
};

var vector_lists = [                                                     // Move vector table
  0x01, 0x10, 0x00,                                                      // Rook move offsets
  0x0E, 0x1F, 0x12, 0x21, 0x00,                                          // Knight move offsets
  0x01, 0x10, 0x0F, 0x11, 0x00                                           // Queen/King, Pawn (+1), Bishop (+2)
];

var best_move = Array(2);                                               // Best move found by computer
var best_score = 0;
var move_list=Array (64,2);
var attacks = Array(128);                                      // Clear white attack map

var user_move_length=0
var user_move=Array(4)
var source_sq=0
var target_sq=0
var keyd=0
var file=0
var rank=0

function parseSquare (char_file, char_rank) {
	file = char_file - 97;                 // Extract file from user input
	rank = 7 - (char_rank - 49);           // Extract rank from user input
	return rank * 16 + file;       
}

function renderBoard() {
  var dark =0;
  var piece = 0;
  var sq = 0;
  console.clear()
  for (sq = 0; sq < 128; sq++) {
    if ((sq & 0x08) == 0) {
	piece= pieces[board[sq]]
	dark^=1
	console.logchar (0x13, dark, piece)                                                
    } else {
	console.logchar (0x0d);
	dark^=1
	sq += 7;
    }
  }
}

function userInput(key) {
  user_move[user_move_length]=key
  user_move_length++
  console.logchar(key)
  if (user_move_length == 4) {
		user_move_length = 0                                      
	    source_sq = parseSquare(user_move[0], user_move[1]);         
	    target_sq = parseSquare(user_move[2], user_move[3]);
		if (board[target_sq] == bK) {                                   
			console.log("Mated!");                          
			document.removeEventListener("keydown", userInput);           
			return;		                                                      
		}
		else {
			board[target_sq] = board[source_sq];
			board[source_sq] = 0x00;
			//console.clear()  
			renderBoard()
			search()
		}
	}
  }
  
  function search() {                                                      // Chess program
    best_score = 0;                                                        // Best score found during search
    best_move[0]=0;
	best_move[1]=0;                                                        // A move associated to best score
	var vector_pointer=0                                                        // Place to store generated moves
	var spiece=0
    //var attacks = new Array(128).fill(0);                                      // Clear white attack map
    for (source_sq = 0; source_sq < 128; source_sq++) {                    // Loop over board squares
      if ((source_sq & 0x08) == 0) {                                       // If square is on board
        spiece = board[source_sq];                                      // Get square content
        if (spiece) {                                                       // If there's a piece on a square
          vector_pointer = vector_pointers[spiece | 0x82];              // Pick up vector pointer for a piece
          vector_pointer -= 0xF1;                                          // Adjust vector pointer starting address
          let vector_offset = 1;                                           // Define vector offset just to enter while loop
          let direction = 1;                                               // Forward or backward vectors traversal direction
          let offset_count = 0;                                            // Keep track of number of offsets in a vector
		  let number_of_moves=0
          while (vector_offset) {                                          // Loop over vector offsets
            vector_offset = vector_lists[vector_pointer] * direction;      // Adjust vector direction
            if (vector_offset == 0) break;                                 // No more vectors to traverse?
            target_sq = source_sq;                                         // Init target square
            while (1) {                                                    // Loop over squares along the given vector offset
              target_sq += vector_offset;                                  // Get next target square
              if ((target_sq & 0x88)) break;                               // Stop if target square is offboard
              if (spiece == wP && direction > 0) break;                     // White pawns move only upwards
              if (spiece == bP && direction < 0) break;                     // Black pawns move only downwards
              if (spiece & 0x02) {                                          // If piece is black
                if (board[target_sq] & 0x02) break;                        // Stop if target square contains a black piece
                if (spiece & 0x04)                                          // Is it a pawn?
                  if ((board[target_sq] + vector_offset) % 2 != 0) break;  // Skip illegal pawn moves
                //move_list.push([source_sq, target_sq]);                    // Add move to the move list
				move_list [number_of_moves][0]= source_sq
				move_list [number_of_moves][1]= target_sq
				number_of_moves++
                if ((board[target_sq] & 0x03) == 1) break;                 // Target square contains a white piece
              } else {                                                     // If piece is white
                if ((spiece + vector_offset) == (wP - 0x10)) break;         // Stop if white pawn moves forward
                attacks[target_sq] = 0x80;                                 // Mark square attacked by white
                if (board[target_sq]) break;                               // Stop if hit any piece
              }
              if ((spiece & 0x08)) continue;                                // Do not follow attack ray for leaper pieces
              else {                                                       // Exception for pawns
                if (((target_sq & 0x70) + spiece) == (bP + 0x20))           // If black pawn move to 6th rank
                  if (board[target_sq+0x10] == 0) continue;                // Generate double push if target is empty
                  else break                                               // Stop if double push target has a piece
                else break                                                 // Stop if black pawn does not attack 6th rank
              }
            }
            if (direction > 0) {                                           // If direction is positive
              vector_pointer++;                                            // Increment vector pointer
              offset_count++;                                              // Increment offset count
              if (vector_lists[vector_pointer] == 0) {                     // No more vectors?
                direction = -1;                                            // Switch direction to negative
                vector_pointer--;                                          // Avoid overflow
              }
            } else {                                                       // If direction is negative
              vector_pointer--;                                            // Decrement vector pointer
              offset_count--;                                              // Decrement offset count
              if (offset_count == 0) break;                                // Stop when all offsets has been traversed
            }
          }
        }
      } 
    }
    for (let i = 0; i < move_list.length; i++) {                           // Loop over moves in a move list
      let valuation = 0x7F;                                                // Default valuation
      valuation += board[move_list[i][1]];                                 // Add target piece value
      if (attacks[move_list[i][0]])                                        // If source square attacked by white
        valuation += board[move_list[i][0]];                               // Add source piece value
      if (attacks[move_list[i][1]])                                        // If target square attacked by white
        valuation -= board[move_list[i][0]];                               // Subtract source piece value
      valuation += (move_list[i][1] + 0x03) & 0x05;                        // Evaluate column (prefer center)
      valuation += move_list[i][1] >> 4;                                   // Evaluate row (prefer 1 row)
      if (valuation > best_score) {                                        // Found better move?
        best_score = valuation;                                            // Update best score
        best_move = move_list[i];                                          // Save best move
      }
    }
    if (board[best_move[1]] == wK) {                                       // If white king is taken computer won
      console.log("White is checkmated!");                                       // Notify user about it
      document.removeEventListener("keydown", userInput);                  // Disable user input
    }
    if (board[best_move[0]] == bP && best_move[1] >= 0x70)                 // If computer promotes a pawn
      board[best_move[1]] = bQ                                             // Turn it into a black queen
    else                                                                   // Otherwise
      board[best_move[1]] = board[best_move[0]];                           // Just make a move
    board[best_move[0]] = 0x00;                                            // and clear source square
    renderBoard();                                                         // Draw board
  }    
  
// main program ---------------------------------------------  
  assembly{
  		; do this in order to be able to print and play with bright. do it only once
  ld a,2		; upper screen
  call 5633	; open channel
  }
renderBoard()
document.addEventListener("keydown", userInput);                         // Listen to keyboard input
