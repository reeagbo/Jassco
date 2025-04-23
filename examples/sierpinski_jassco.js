include ("io.asc")
include ("graph.asc")
include ("math.asc")

var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");

var n = 4;

var startpos = 0;
var endpos = 1;
var nextpos = 1;
var i = 0;

var mid1x = 0;
var mid1y = 0;
var mid2x = 0;
var mid2y = 0;
var mid3x = 0;
var mid3y = 0;

var x1 = Array(150);
var y1 = Array(150);
var x2 = Array(150);
var y2 = Array(150);
var x3 = Array(150);
var y3 = Array(150);

x1[0] = 20;
y1[0] = 20;
x2[0] = 70;
y2[0] = 120;
x3[0] = 120;
y3[0] = 20;


for (i = 0; i < n; i++)
{
    for (startpos = startpos; startpos < endpos; startpos++)
    {

        mid1x = (x1[startpos] + x2[startpos]) / 2;
        mid1y = (y1[startpos] + y2[startpos]) / 2;
        mid2x = (x2[startpos] + x3[startpos]) / 2;
        mid2y = (y2[startpos] + y3[startpos]) / 2;
        mid3x = (x1[startpos] + x3[startpos]) / 2;
        mid3y = (y1[startpos] + y3[startpos]) / 2;

        x1[nextpos] = x1[startpos];
        y1[nextpos] = y1[startpos];
        x2[nextpos] = mid1x;
        y2[nextpos] = mid1y;
        x3[nextpos] = mid3x;
        y3[nextpos] = mid3y;

        nextpos++;

        x1[nextpos] = mid1x;
        y1[nextpos] = mid1y;
        x2[nextpos] = x2[startpos];
        y2[nextpos] = y2[startpos];
        x3[nextpos] = mid2x;
        y3[nextpos] = mid2y;

        nextpos++;

        x1[nextpos] = mid3x;
        y1[nextpos] = mid3y;
        x2[nextpos] = mid2x;
        y2[nextpos] = mid2y;
        x3[nextpos] = x3[startpos];
        y3[nextpos] = y3[startpos];

        nextpos++;
    }
    endpos = nextpos;
}

for (i = startpos; i < endpos; i++)
{
    mid1x = x1[i];
    mid1y = y1[i];
    mid2x = x2[i];
    mid2y = y2[i];
    mid3x = x3[i];
    mid3y = y3[i];
    
    ctx.moveTo(mid1x, mid1y);
    ctx.lineTo(mid2x, mid2y);
    ctx.lineTo(mid3x, mid3y);
    ctx.lineTo(mid1x, mid1y);
}

console.log ("Sierpinski triangle");