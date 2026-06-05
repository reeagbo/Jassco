# Technical Description

This document describes the current technical scope of JASSCO.

JASSCO is a Python cross-compiler that parses a small JavaScript-like program
with `esprima` and generates Z80 assembly. The current practical target is ZX
Spectrum.

JASSCO uses JavaScript ES2 as a reference, but it is not a complete JavaScript
runtime. It supports a small subset of JavaScript plus a few explicit non-JS
extensions for Z80-oriented work.

## Compilation Model

The compiler reads an input JavaScript file and writes a single assembly output
file.

Main stages:

- `main.py` loads the input, preprocesses non-JS blocks, parses the code, and
  writes the final assembly.
- `translator.py` walks the JavaScript AST and emits Z80 assembly fragments.
- `utils.py` contains shared helpers for diagnostics, labels, includes, and
  low-level transformations.
- `config.py` stores compiler configuration and shared compilation state.
- `*.asc` files provide assembly support libraries such as I/O, graphics,
  memory, math, and timing.

Assembly support files can be included from JavaScript with:

```javascript
include("io.asc")
```

## Data Types

JASSCO currently supports:

- 16-bit signed integers.
- Booleans, internally handled as integer-compatible `0` and `1` values.
- Limited strings.
- Integer arrays.
- Integer 2D matrices.
- Simple integer dictionaries/maps.

Floating-point numbers are not supported.

## Declarations

Variables and constants must be declared with an initial value. The compiler
uses the initial assignment to infer the type.

```javascript
const white = 0x05
var rank = 0
var text = "hello"
var a = 0, b = 1
```

Declarations without assignment are not supported:

```javascript
// Not supported
var number
```

All variables are currently global, even if they are declared inside a function
or block.

## Arrays, Matrices, And Maps

Integer arrays:

```javascript
var values = [1, 2, 3, 4]
values[2] = 10
console.log(values[2])
```

Integer matrices:

```javascript
var matrix = [[1, 2, 3], [4, 5, 6]]
matrix[1][2] = 10
console.log(matrix[1][2])
```

Integer maps:

```javascript
var dict = {3: 6, 5: 10, 4: 8}
dict[5] = 99
console.log(dict[5])
```

Arrays must be variables. Constant arrays are not supported.

## Empty Data Structures

JASSCO supports a few constructor-like helpers to reserve fixed-size data
structures.

```javascript
var text = String(5)     // empty string with room for 5 characters
var arr = Array(5)       // empty array with 5 numbers
var matrix = Array(5, 2) // empty matrix
var dict = Map(5, 4)     // empty dictionary/map structure
```

These are practical compiler extensions, not full JavaScript object support.

## Control Flow

Supported control-flow structures:

- Blocks.
- `if`, `else if`, `else`.
- `for`.
- `while`.
- `do while`.
- `switch`, `case`, `default`.
- `break`.
- `continue`.

Example:

```javascript
for (i = 0; i < 10; i++) {
    if (i == 3) {
        continue
    }
    console.log(i)
}
```

`break` outside loops/switches and `continue` outside loops are reported as
compiler errors.

## Expressions

Integer comparisons:

- `==`
- `!=`
- `<`
- `>`
- `<=`
- `>=`

Integer arithmetic:

- `+`
- `-`
- `*`
- `/`
- `%`

Integer bitwise/logical-style operators:

- `&`
- `|`
- `^`
- `&&`
- `||`
- `!`
- `~`

Assignments:

- `=`
- `+=`
- `-=`
- `*=`
- `/=`
- `%=`
- `&=`
- `|=`
- `^=`
- `<<=`
- `>>=`

Updates:

- `++`
- `--`

String support is intentionally small. String assignment, equality comparison,
and limited concatenation are supported in known cases.

## Functions

Function declarations and calls are supported.

```javascript
function sum(a, b) {
    return a + b
}

total = sum(5, 6)
```

Important details:

- Function parameters are currently treated as integer-compatible values.
- A function with `return` must be used where a value is expected.
- A function without `return` must be used as a statement.
- Recursion is supported in simple cases.
- Multiple sibling recursive calls in the same function level are not supported
  yet.

Example of the unsupported recursive pattern:

```javascript
function fibonacci(n) {
    if (n < 2) return n
    return fibonacci(n - 1) + fibonacci(n - 2)
}
```

Complex function-call arguments may be unsafe. Prefer intermediate variables:

```javascript
// Not recommended
receive_bit(input_bits[input_bits_pointer])

// Supported pattern
send_bit = input_bits[input_bits_pointer]
receive_bit(send_bit)
```

## Raw Assembly Blocks

Raw assembly can be embedded in JavaScript source with `assembly { ... }`.

```javascript
assembly {
    ld a, 1
    or a
}
```

The content is inserted into the generated assembly output without semantic
analysis. Use this for low-level operations, ports, interrupts, or target-
specific code.

`eval` is reserved internally by the compiler and should not be used as normal
JavaScript.

## Console And Input Helpers

`console.log()` is supported for common output cases.

Additional console helpers:

- `console.logstring(value)`: print a string without line feed.
- `console.lognumber(value)`: print a number.
- `console.logchar(value)`: print a character/byte.
- `console.clear()`: clear the screen using the ROM routine.

Keyboard input helper:

```javascript
read(text)
```

This reads keyboard input into a string variable.

## Keyboard Events

Limited keyboard event support is available through:

```javascript
document.addEventListener("keydown", handler)
document.removeEventListener("keydown", handler)
```

This is a compiler-supported pattern, not a browser event loop. The generated
program waits for key input according to the assembly implementation.

## Canvas-Like Graphics

JASSCO supports a very small canvas-like drawing subset:

- `document.getElementById(...)`
- `canvas.getContext("2d")`
- `ctx.moveTo(x, y)`
- `ctx.lineTo(x, y)`
- `ctx.clearScreen()`

Example:

```javascript
var canvas = document.getElementById("myCanvas")
var ctx = canvas.getContext("2d")

ctx.moveTo(10, 10)
ctx.lineTo(100, 50)
```

These methods map to ZX Spectrum-oriented assembly routines.

## Math, String, Memory, And Timing Helpers

Math:

- `Math.random()` returns a 16-bit pseudo-random number.

String:

- `String.fromCharCode(value)` returns a character from an 8-bit value.
- `String.length(value)` returns string length.

Memory:

- `memory.read(address)`
- `memory.write(address, value)`
- `memory.copy(source, target, size)`

Timing:

- `setInterval(clock, milliseconds)`
- `clearInterval(clock)`

Timing support is based on the ZX Spectrum interrupt cadence. The timer function
name is currently expected to be `timer_function`.

Example:

```javascript
var seconds = 0

function timer_function() {
    seconds++
    console.log(seconds)
}

setInterval(clock, 1000)
```

## Diagnostics

The compiler now separates:

- Fatal compiler errors, which stop reliable compilation.
- Compatibility warnings, which describe tolerated patterns used by existing
  working examples.

The generated ASM for the current reference examples is protected by golden
tests.

## Known Restrictions

Current major restrictions:

- No floating-point numbers.
- No full JavaScript runtime.
- No dynamic memory management.
- All variables are global.
- Declarations must include an initial assignment.
- Function parameters are integer-compatible.
- Arrays must be variables, not constants.
- String support is limited.
- Objects are not generally supported, except for documented compiler patterns.
- Complex function-call arguments should be replaced with intermediate
  variables.
- Multiple sibling recursive calls in the same function level are not supported
  yet.

See `docs/RESTRICTIONS.md` for the current working list of restrictions and
compatibility notes.
