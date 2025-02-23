# Overview
The aim of this document is to describe the technical capabilities os the Jassco compiler. Jassco is a cross-compilar, able to generate Z80 assembly code from a JavaScript piece of code. 
The document includes:
- Features and capailities supported by the compiler.
- Restrictions and knwon issues.

# Technical description
Jassco:
- is written in Python and it makes extensive use of the esprima library, a well known JavaScript parser.
- is mostly based on JavaScript ES2. However, it is not fully supported and it also has some add-ons that allow specific capabilities needed for z80 based computers. Both will be describes later.
- support for daya types is limited: 16-bit signed integers, boolean and very limited string operations.
- supports all basic code flows allowed by JavaScript ES2.

## Data Management
This section describes all data capabilities supported by the compiler, including different data types, variable types and data structures.

### Literals
Jassco supports three types of literal atoms:
- Integers: all numbers are 16-bit signed integers.
- Booleans: supported and internally handled as 0s and 1s.
- Strings: supported with very limited capabilities.

### Variable declararions
Diffferent types of decalrations are allowed:
- Constants
- Variables
All of them can be of any of the types described above.
Variables are declared in JavaScript standard way. However, Several non-JS possibilities have been created. The reason for this is that it is not practical to have variables of dynamic sizes, as this would require mechanisms to move those structures in the computer menory. As an alternative, empty arrays, strings and dictionaries can be acreated.

An empty array can be created as:
var string1=String(5)
This will create an empty 5-character string. Note: String has capital S, as it is a JS pre-defined object.

### Identifiers
No content.

### Arrays
Only arrays of integers and 2D matrices are supported. Standard JS creation for both is available. Also, similarly to empty strings, empty arrays and dictionaries can be created:

An empty array can be created as:
var array1=Array(5)
This will create an empty 5-number array. Note: Array has capital A, as it is a JS pre-defined object.

var matrix1=Array(5,4)
This will create an empty 5x4 numbers array. Note: Array has capital A, as it is a JS pre-defined object.

### Objects
Very limited (almost non-existing) support for objects. However, specific object methods cases are supported:
- "charAt", "charCodeAt" methods are supported for string variables.

## Code flows
This section describes all the code flows supported by the compiler.

### Blocks
No content.

### Break
Break instruction in order to break out of Switch statement is supported.

### Calls
Standard function calls including parameters are supported. Using intergers as parameters is fully supported. String support has gone through limited testing. 

There are specific non-JS calls supported by the system:
- "read" allows reading keyboard and saving its contents to a variable:
  Example: read (string1), will read a string from the keyboard and store it string1 variable.
- "include" allows adding z80 assembly libraries to the code:
  Example: include ("io.asc"), will include in the produced assembly the code included in the io.asc file.
- Calls to console have limited support:
  - "console.log" is supported.
  - some other non-JS methods have been added to simplify logging different varable types in the screen:
    - "console.logstring":
      Example: console.logstring("hello"), similar to console.log, but without line feed.
    - "console.lognumber":
      Example: console.lognumber(55), will log "55" in the screen.
    - "console.logchar":
      Example: console.logchar("h"), will log "h" in the screen. This method may seem redundant, but it comes very handy as it allows us to print values stored as bytes.
    Note: all of these method support variables, and numeric ones support expressions.

### Continue
Continue instruction in order to skip iterations in For loops is supported.

### Do-While / While-Do statements
Do-While and While-Do code structures are supported.

### For statement
For code structures are supported.

### Functions

### If statement

### Return

### Switch statement

## Expressions
This section describes all the different expressions supported by the compiler.

### Binary expressions
### Member expressions
### Unary expressions
### Update expressions
### Assignments
### Expressions

# Restrictions
This section is mostly a list of disclaimers that will improve with time.
- No support for decimal numbers.
- There are no memory management facilities embedded in the compiler. It would make the code too heavy for the tiny z80 computers. The programmer needs to make sure that the code will read from and write in the right places and also that the code will not overwrite other code sections.
- All variables are global, regardless where they are declared.
- Strings restrictions:
  - no support for string expressions and operations, except those described above.
  - no support for any data structure (arrays, matrices...) with strings.

 
