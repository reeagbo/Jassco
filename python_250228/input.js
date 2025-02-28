include ("io.asc")
include ("graph.asc")
include ("math.asc")

var x1p=0, y1p=0, x2p=0, y2p=0, x3p=0, y3p=0, x4p=0, y4p=0, x5p=0, y5p=0, x6p=0, y6p=0, np=0

var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");

function sierpinski(x1, y1, x2, y2, x3, y3, n) {
	if (n >= 0) {
		//console.log (n)
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
		ctx.lineTo(x3, y3);
		ctx.lineTo(x1, y1);
	}
	
	if (n>0)
	{
		x1p=x1
		y1p=y1
		x2p=(x1 + x2) / 2
		y2p=(y1 + y2) / 2
		x3p=(x1 + x3) / 2
		y3p=(y1 + y3) / 2
		x4p=x2
		y4p=y2
		x5p=(x2 + x3) / 2
		y5p=(y2 + y3) / 2
		x6p=x3
		y6p=y3
		np=n-1
		//sierpinski(x1, y1, (x1 + x2) / 2, (y1 + y2) / 2, (x1 + x3) / 2, (y1 + y3) / 2, n - 1);
		//sierpinski((x1 + x2) / 2, (y1 + y2) / 2, x2, y2, (x2 + x3) / 2, (y2 + y3) / 2, n - 1);
		//sierpinski((x1 + x3) / 2, (y1 + y3) / 2, (x2 + x3) / 2, (y2 + y3) / 2, x3, y3, n - 1);
		sierpinski(x1p, y1p, x2p, y2p, x3p, y3p, np);
		sierpinski(x2p, y2p, x4p, y4p, x5p, y5p, np);
		sierpinski(x3p, y3p, x5p, y5p, x6p, y6p, np);
	}
}

sierpinski(20, 20, 70, 120, 120, 20, 2);
