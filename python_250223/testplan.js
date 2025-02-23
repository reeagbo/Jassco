include ("io.asc")
include ("math.asc")
include ("graph.asc")
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

//---------------------------------------------------------
console.log ("Printout tests")

var numa = [11, 22, 33]
num1=10
str1="adios"
console.log (1, " ", num1, " ", "hola ", str1, " ", numa[2])

console.log("Console tests")
console.log("Output: he100200hellogoodbye")
console.logchar("h","e")
console.lognumber(100,200)
console.logstring("hello", "goodbye")

//
console.log ("Keydown event")
function use_inp(key) {
    if (key == "a") {
		document.removeEventListener("keydown", use_inp);
		console.log("keydown inactive!");
        return;
    } else {
        console.log("keydown active!");
    }
}

console.log("press key or -a- to deactivate event");
document.addEventListener("keydown", use_inp);    

//---------------------------------------------------------
console.log ("String operations")

cha1=""
str1="hello"
str2=""
console.log ("literal: goodbye")
console.log ("Variable (hello): ",str1)
cha1=str1.charAt(1)
console.log ("CharAt (e): ", cha1)
str2=str1
console.log ("String copy (hello): ",str2)

//---------------------------------------------------------
console.log ("AssignmentExpression tests")
console.log ("Integer/String")
num1=10
tex="Hello!"
console.log ("(10): ", num1, ". (Hello!) ", tex)
read(key)

console.log ("Shift assignments")
num1=1024
num1 <<= 4
console.log ("<<= The number is (16384): ", num1)
num1=1024
num1 >>= 4
console.log (">>= The number is (64): ", num1)
read(key)

console.log ("Assignment operators")
num1=15
num1 += 10
console.log ("+= The number is (25): ", num1)
num1=15
num1 -= 10
console.log ("-= The number is (5): ", num1)
num1=15
num1 *= 10
console.log ("*= The number is (150): ", num1)
num1=15
num1 /= 10
console.log ("/= The number is (1): ", num1)
num1=15
num1 %= 10
console.log ("%= The number is (5): ", num1)
read(key)

num1=15
num1 &= 17
console.log ("&= The number is (1): ", num1)
num1=15
num1 |= 17
console.log ("|= The number is (31): ", num1)
num1=15
num1 ^= 17
console.log ("^= The number is (30): ", num1)
read(key)

//---------------------------------------------------------
console.log ("BinaryExpression tests")
console.log ("Add/Subtraction tests")

console.log ("Multiplication/division tests")
num1=0
num1 = 10*10
console.log ("10*10= ", num1)
num1=0
num1 = 11/2
console.log ("11/2= ", num1)
num1=0
num1 = 11%2
console.log ("11%2= ", num1)
read(key)

console.log ("Comparison tests")
if (1==1) {console.log("1==1")}
if (2==1) {console.log("2==1")}
if (1==2) {console.log("1==2")}
if (1!=1) {console.log("1!=1")}
if (2!=1) {console.log("2!=1")}
if (1!=2) {console.log("1!=2")}
if (1>1) {console.log("1>1")}
if (2>1) {console.log("2>1")}
if (1>2) {console.log("1>2")}
if (1<1) {console.log("1<1")}
if (2<1) {console.log("2<1")}
if (1<2) {console.log("1<2")}
if (1>=1) {console.log("1>=1")}
if (2>=1) {console.log("2>=1")}
if (1>=2) {console.log("1>=2")}
if (1<=1) {console.log("1<=1")}
if (2<=1) {console.log("2<=1")}
if (1<=2) {console.log("1<=2")}
read(key)

console.log ("Bitwise operations")
num1=0
num1 = 15 & 17
console.log ("The number is (1): ", num1)
num1 = 15 | 17
console.log ("The number is (31): ", num1)
num1 = 15 ^ 17
console.log ("The number is (30): ", num1)
num1 = ~15
console.log ("The number is (65520): ", num1)
read(key)

//---------------------------------------------------------
console.log ("CallExpression tests")

read(key)

//---------------------------------------------------------
console.log ("DoWhile tests")
count = 0;
do {
  count = count+1;
	console.log ("Number (stop at 5): ", count)
}
while (count < 5); 
read(key)

//---------------------------------------------------------
console.log ("ForStatement tests")
console.log ("Ascending")
for (num1=1; num1<=5; num1=num1+1) {
	console.log ("Number (stop at 5):", num1)
}
console.log ("Descending")
for (num2=10; num2>=5; num2=num2-1) {
	console.log ("Number (stop at 5):", num2)
}
read(key)

console.log ("For-Break")
num1=0
var i=0
for (i = 0; i < 10; i++)
{
	if (i == 3) { break; }
  num1 =  i;
} 
console.log ("Stop at (3): ", i)
read(key)

console.log ("For-Continue")
num1=0
for (i = 0; i < 10; i++)
{
	if (i == 3) { continue; }
  console.log ("Skip (3): ", i)
} 

console.log ("Nested Loops")
var mat1 = [[1,2,3],[4,5,6],[7,8,9]]

for (num1=0; num1<=2; num1++) {
	for (num2=0; num2<=2; num2++) {
		console.log (mat1[num1][num2])
	}	
}

//---------------------------------------------------------
console.log ("FunctionDeclaration tests")

read(key)

//---------------------------------------------------------
console.log ("IfStatement tests")
num1=5
if (num1 < 10) {
  tex = "Good morning";
} else if (num1 < 20) {
  tex = "Good day";
} else {
  tex = "Good evening";
}
console.log ("Time: ", num1, ", Greeting: ", tex)

num1=15
if (num1 < 10) {
  tex = "Good morning";
} else if (num1 < 20) {
  tex = "Good day";
} else {
  tex = "Good evening";
}
console.log ("Time: ", num1, ", Greeting: ", tex)

num1=22
if (num1 < 10) {
  tex = "Good morning";
} else if (num1 < 20) {
  tex = "Good day";
} else {
  tex = "Good evening";
}
console.log ("Time: ", num1, ", Greeting: ", tex)
read(key)

//---------------------------------------------------------
console.log ("Literal tests")

read(key)

//---------------------------------------------------------
console.log ("Identifier tests")

read(key)

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

//---------------------------------------------------------
console.log ("UptateExpression tests")
console.log ("Ascending")
for (num2=1; num2<=5; num2++) {
	console.log ("Number (stop at 5):", num2)
}
console.log ("Descending")
for (num2=10; num2>=5; num2--) {
	console.log ("Number (stop at 5):", num2)
}
read(key)

//---------------------------------------------------------
console.log ("VariableDeclaration tests")

read(key)

//---------------------------------------------------------
console.log ("WhileStatement tests")

read(key)

//---------------------------------------------------------
console.log ("Function tests")
num1=5
num2=6
function sum(num3, num4) {
    num3= num3+num4
        return num3;
};

num1= sum(num1, num2)
console.log ("6 + 5 (11) = ", num1)

//---------------------------------------------------------
console.log ("Recursion tests")

function counter(cou1) {
    if(cou1 > 5) {
	console.log("contador: ", cou1)
        cou1 = cou1 - 1;
        counter(cou1);
    } else {
        return;
    };
};
counter(10);
read(key)

//---------------------------------------------------------
console.log ("String operations")
console.log ("String assignment")
tex1="hello"
console.log ("(hello): ", tex1)
tex1="goodbye"
console.log ("(goodbye): ", tex1)
read (key)


console.log ("Comparisons")
console.log ("(different!), (same!)")
tex1="adio"
tex2="adi"
if (tex1==tex2) {
	console.log ("same!")
}
else {
	console.log ("different!")
}
tex1="adio"
tex2="adio"
if (tex1==tex2) {
	console.log ("same!")
}
else {
	console.log ("different!")
}

console.log ("String length")
num1=0
tex="hello"
num1= tex.length
console.log ("Length (5): ", num1)

//---------------------------------------------------------
console.log ("Graph Tests")
num1=0
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");

for (num1=0; num1<=50; num1+=5) {
	ctx.moveTo(128-num1, 96-num1)
	ctx.lineTo(128-num1, 96+num1)
	ctx.lineTo(128+num1, 96+num1)
	ctx.lineTo(128+num1, 96-num1)
	ctx.lineTo(128-num1, 96-num1)
}

//---------------------------------------------------------
console.log ("Data Access Tests")

var arr1= [1,2,3,4]
console.log ("Before: arr1[2](3): ", arr1[2])
arr1[2]=10
console.log ("After: arr1[2](10): ", arr1[2])

var mat2= [[1,2,3],[4,5,6],[7,8,9]]
console.log("Before, mat1[1][2](6): ", mat2[1][2])
mat2[1][2]=10
console.log ("After, mat1[1][2](10): ", mat2[1][2])

var dic1 = {3:6, 5:10, 4:8}
console.log("Before dic1[5])(10): ", dic1[5])
dic1[5]=99
console.log ("Before dic1[5])(99): ", dic1[5])

//---------------------------------------------------------
console.log ("16-bit signed operations")

console.log("100+10 (110): ", 100+10)
console.log("-100+10 (-90): ", -100+10)
console.log("100-10 (90): ", 100-10)
console.log("-100-10 (-110): ", -100-10)

console.log("100/10 (10): ", 100/10)
console.log("-100/10 (-10): ", -100/10)
console.log("100/-10 (-10): ", 100/-10)
console.log("-100/-10 (10): ", -100/-10)

console.log("100*10 (1000): ", -100*-10)
console.log("-100*10 (-1000): ", -100*10)
console.log("100*-10 (-1000): ", 100*-10)
console.log("-100*-10 (1000): ", -100*-10)