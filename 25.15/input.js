include ("io.asc")
include ("math.asc")
include ("graph.asc")
include ("memory.asc")
var count=0
var key=""
var num1=0
var num2=0
var tex1=""
var tex2=""
var tex=""
var str1=""
var str2=""
var cha1=""
var i=0


//---------------------------------------------------------
console.log ("SwitchStatement tests")
num1=2
tex=""
switch (num1) {
	case 1:
    	tex = "Monday";
    	break;
  	case 2:
	  	tex = "Tuesday";
	  	break;
	case 3:
		tex = "Wednesday";
		break;
}
console.log ("(Tuesday):", tex)
read(key)  
