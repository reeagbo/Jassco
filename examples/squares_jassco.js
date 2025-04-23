include ("io.asc")
include ("math.asc")
include ("graph.asc")

console.log ("Graph Tests")
var num1=0
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");

for (num1=0; num1<=50; num1+=5) {
ctx.moveTo(128-num1, 96-num1)
ctx.lineTo(128-num1, 96+num1)
ctx.lineTo(128+num1, 96+num1)
ctx.lineTo(128+num1, 96-num1)
ctx.lineTo(128-num1, 96-num1)
}