include ("io.asc")
include ("time.asc")

var hours=0; var minutes=0; var seconds=0 

function timer_function()
{
	console.clear()
	console.log(hours,":",minutes,":",seconds)
	seconds++
	if (seconds==10) { // stops as indicated here
		clearInterval(clock)
	}

}

function userInput () {}

// main code
setInterval(clock, 1000);
document.addEventListener("keydown", userInput); // activate keyboard listening (not actually used)

