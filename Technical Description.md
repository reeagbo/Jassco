# Overview
The aim of this document is to describe the technical capabilities os the Jassco compiler. Jassco is a cross-compilar, able to generate Z80 assembly code from a JavaScript piece of code. 
The document includes:
- Features and capailities supported by the compiler.
- Restrictions and known issues.

# Technical description
Jassco:
- is written in Python and it makes extensive use of the esprima library, a well known JavaScript parser.
- is mostly based on JavaScript ES2. However, it is not fully supported and it also has some add-ons that allow specific capabilities needed for z80 based computers. Both will be described later.
- support for daya types is limited: 16-bit signed integers, boolean and very limited string operations.
- supports all basic code flows allowed by JavaScript ES2.

# Data Management
This section describes all data capabilities supported by the compiler, including different data types, variable types and data structures.

## Literals
Jassco supports three types of literal atoms:
- Integers: all numbers are 16-bit signed integers.
- Booleans: supported and internally handled as 0s and 1s.
- Strings: supported with very limited capabilities.

## Variable and constact declarations
Diffferent types of declarations are allowed.
- Constants
- Variables

Notes:
- All of them can be of any of the types described above.
- Declarations cannot be without assignemnt. This is needed to identify the variable type.
- Variables are declared in JavaScript standard way. However, several non-JS possibilities have been created (see **non-JS capabilities** section).  

## Identifiers
No content.  

## Arrays
Only arrays of integers and 2D matrices are supported. Standard JS creation for both is available. Also, similarly to empty s, empty arrays and dictionaries can be created (see **non-JS capabilities** section).   

## Objects
Very limited (almost non-existing) support for objects. However, specific object methods cases are supported:
- "charAt", "charCodeAt" methods are supported for  variables.

# Code flows
This section describes all the code flows supported by the compiler.

## Blocks
No content.

## Break
Break instruction in order to break out of Switch and If statements is supported.  
Example:  
*for (i = 0; i < 10; i++)  
{  
	if (i == 3) { break; }  
  num1 =  i;  
}   
console.log ("Stop at (3): ", i)*  


## Continue
Continue instruction in order to skip iterations in For loops is supported.  
Example:  
*for (i = 0; i < 10; i++)  
{  
	if (i == 3) { continue; }  
  console.log ("Skip (3): ", i)  
}*

## Do-While / While-Do statements
Do-While and While-Do code structures are supported.  
Example:  
*count = 0;  
do {  
  count = count+1;  
	console.log ("Number (stop at 5): ", count)  
}  
while (count < 5);*

## For statement
For code structures are supported.  
Example:  
*for (num1=1; num1<=5; num1=num1+1) {  
	console.log ("Number (stop at 5):", num1)  
}*  

## Functions
Standard function calls including parameters are supported. Using intergers as parameters is fully supported.  
- A function using *Return* must be part of an expression, and a function without *Return* must not.
-  support has gone through limited testing.
- Recursion is supported.
- Example:  
*num1=5  
num2=6  
function sum(num3, num4) {  
    num3= num3+num4  
        return num3;  
};  
num1= sum(num1, num2)  
console.log ("6 + 5 (11) = ", num1)*

Known issues: see Rescrictions section.  

## If statement
If-Else statements are supported.  
Example:  
*num1=5  
if (num1 < 10) {  
  tex = "Good morning";  
} else if (num1 < 20) {  
  tex = "Good day";  
} else {  
  tex = "Good evening";  
}  
console.log ("Time: ", num1, ", Greeting: ", tex)*

## Return
Return statement in functions is supported. See Functions section.  

## Switch statement
Switch-Break statements are supported.  
Example:  
*num1=2  
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
console.log ("(Tuesday):", tex)*

# Expressions
This section describes all the different expressions supported by the compiler.  

## Binary expressions
All the expressions used to build binary expressions below are supported.
Integers
- Comparison expressions:  
	equal "==", not equal "!=", less "<", more ">", less or equal "<=", more or equal ">="  
- Arithmetical expressions:  
	sum "+", subtraction "-", multiplication "*", division "/", remainder "%"  
- Logical expressions:
 	and "&", or "|", xor "^"

Example:  
*if (1!=1) {console.log("1!=1")}*

## Member expressions
This section covers a number of different items.  

### Data structures:  

- Array access:  
*var arr1= [1,2,3,4]  
console.log ("Before: arr1[2](3): ", arr1[2])  
arr1[2]=10  
console.log ("After: arr1[2](10): ", arr1[2])*

- 2D matrices access:  
Example:
*var mat2= [[1,2,3],[4,5,6],[7,8,9]]  
console.log("Before, mat1[1][2](6): ", mat2[1][2])  
mat2[1][2]=10  
console.log ("After, mat1[1][2](10): ", mat2[1][2])*

- Dictionaries access:  
*var dic1 = {3:6, 5:10, 4:8}  
console.log("Before dic1[5])(10): ", dic1[5])  
dic1[5]=99  
console.log ("Before dic1[5])(99): ", dic1[5])*

## Operations
### Bitwise operations
Standard JavaScript bitwise operations (&&, ||, !) are supported.  
Example:  
*if (i && 3) { break; }*  

### Unary expressions
Standard JavaScript unary expressions are supported: negate "~", negative "-".  
Example:  
*num1 = ~15  

### Update expressions
All the unary expressions below are supported:  
increment "++", decrement "--"  

*num1 = 15  
console.log ("The number is (16): ", num1++)*

### String operations  
Very limited support.  
- Comparison expressions:  
	equal "=="  
- Arithmetical expressions:  
	sum "+"  
Example:  
*if ("hello"=="hello") {console.log("same!")}*  

### Assignments
All the unary expressions below are supported:  
**Integers**  
equal "=", increment by "+=", decrement by "-=", multiply by "*=", divide by "/=", remainder by "%="  
and with "&=", or with "|=", not with "^="  
shift left "<<=", shift right ">>="  

**Strings**  
equal "="  

### Expressions  
No content.

# Objec support and Non-JS capabilities

It looks like a messed-up title for a section. The reason for this is that, at the moment, the compliler supports a few standard object methods and a few "made-up" object methods and other facilities. The more systematic way to classify them was to have them together.

## Empty data structures creation
Variables are declared in JavaScript standard way. However, Several non-JS possibilities have been created. The reason for this is that it is not practical to have variables of dynamic sizes, as this would require mechanisms to move those structures in the computer menory. As an alternative, empty arrays, strings and dictionaries can be created.

An empty array can be created as:  
*var string1=String(5)*  
This will create an empty 5-character string. Note: String has capital S, as it is a JS pre-defined object.  

An empty array can be created as:  
*var array1=Array(5)*  
This will create an empty 5-number array. Note: Array has capital A, as it is a JS pre-defined object.  

An empty matrix can be created as:  
*var matrix1=Array(5,2)*  
This will create an empty 5x4 numbers matrix. Note: Array has capital A, as it is a JS pre-defined object.  

An empty dictionary can be created as:  
*var dict1=Map(5,4)*  
This will create an empty 5 entries, 2 fields dictionary. Note: Map has capital M, as it is a JS pre-defined object.  

## Include
**include** allows adding z80 assembly libraries to the code:  
Example:  
*include ("io.asc")*, will include in the produced assembly the code included in the io.asc file.  

## Assembly
This primitive allows inclusion of raw assembly blocks in the JS code. This allows low level instructions like interrupts, port access or others directly without the need of additional libraries. Any text within the curly braces is inserted in the output code without modifications or analysis.  
Example:  
*include {  
    ld a, 1  
    or a  
    }*  
    
## System calls
There are specific non-JS calls supported by the system. Note that, against JS standard, these methods are not case sensitive.  

**read** allows reading keyboard and saving its contents to a variable:  
  Example: read (string1), will read a string from the keyboard and store it string1 variable.  

**console** calls to console have limited support:
	  - "console.log" is supported.
	  - some other non-JS methods have been added to simplify logging different varable types in the screen:
		    - **.logstring**:  
      			Example:
      			console.logstring("hello"), similar to console.log, but without line feed.  
    	            - **.lognumber**:  
      			Example:  
      			console.lognumber(55), will log "55" in the screen.  
    		    - **.logchar**:  
      			Example:
      			console.logchar("h"), will log "h" in the screen. This method may seem redundant, but it comes very handy as it allows us to print values stored as bytes.  
	 	    - **.clear** clears the screen including attributes, using the ROM routine.
    Note: all of these method support variables, and numeric ones support expressions.

**keydown** event (to read keys from keyboard) is supported. Note that running this event keeps the program wating until a key is pressed.  
Example:  
*function use_inp(key) {  
    if (key == "a") {  
		document.removeEventListener("keydown", use_inp);  
		console.log("keydown inactive!");  
        return;  
    } else {  
        console.log("keydown active!");  
    }  
}
console.log("press key or -a- to deactivate event");
document.addEventListener("keydown", use_inp);*  

**canvas** object allows drawing lines in the screen. Only a few methods are supported:    
	- **.moveTo** moves the cursor position to a screen coordinates.  
	- **.lineTo** draws a line from the cursor position to the indicated coordinates.  
 	- **.clearScreen** clears the screen  
	Example:  
	*num1=0  
	var canvas = document.getElementById("myCanvas");  
	var ctx = canvas.getContext("2d");  
	for (num1=0; num1<=50; num1+=5) {  
		ctx.moveTo(128-num1, 96-num1)  
		ctx.lineTo(128-num1, 96+num1)  
		ctx.lineTo(128+num1, 96+num1)  
		ctx.lineTo(128+num1, 96-num1)  
		ctx.lineTo(128-num1, 96-num1)  
	}*  

**math** object. Limited support:  
	- **.random** generates a 16-bit pseudo-random number.  

**string** object. Limited support:   
	- **.fromCharCode** returns a char corresponding to an 8-bit ASCII value.  
 	Example: 
  	*let char = String.fromCharCode(65);*  
   	- **.length** retruns the string length.  
 	Example: 
  	*let char = String.length("hola");*  

**memory** object. Created to deal with low level memory operations, typically not supported by JS.   
	- **read** reads a memory position. Syntax: memory.read (address)  
 	- **write** writes a memory position. Syntax: memory.write (address, value)  
  	- **copy** reads a memory position. Syntax: memory.copy (source, target, block size)  
 	Example:  
  	*value= memory.read (0xA000)  
	console.log(value)  
 	memory.write(0xA0000, value+1)  
  	console.log(value)*  
   	Example:
    	*memory.copy(0xA000, 0xB000, 256)*

# Restrictions
This section is mostly a list of disclaimers that will improve with time.  
- No support for decimal numbers.  
- There are no memory management facilities embedded in the compiler. It would make the code too heavy for the tiny z80 computers. The programmer needs to make sure that the code will read from and write in the right places and also that the code will not overwrite other code sections.  
- Variables:  
	- all variables are global, regardless where they are declared.  
  - matrices and arrays type is always integer.  
  - all parameters in function declarations are considered integers.  
  - declarations with non-literal values not supported. Needed for type identification.  
  - declarations without assignment (i.e. var num1) not allowed. Needed for type identification.  
- Strings:  
  - no support for string expressions and operations, except those described above.  
  - no support for any data structure (arrays, matrices...) with strings.  
- Function recursion: non-basic scenarios may not work.
  - recursion with more than one call to the recursive function will not work.
Example:
*function fibonacci(n) {  
    if (n < 2) return n;  
    return fibonacci(n - 1) + fibonacci(n - 2);  
}*.  
- "eval" is reserved for internal use (it's rarely used in JS anyway).  

 
