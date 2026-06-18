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
// jassco: include("io.asc")
```

This comment directive is the supported include form. It keeps the source file
valid for regular JavaScript tools while still letting JASSCO embed the
requested assembly support library. Plain `include("...")` calls are not part of
the supported source format.

## Data Types

JASSCO currently supports:

- 16-bit signed integers.
- Booleans, internally handled as integer-compatible `0` and `1` values.
- Limited strings.
- Integer arrays.
- Integer 2D matrices.
- String arrays declared as literal text tables.
- Simple integer dictionaries/maps.

Floating-point numbers are not supported.

## Declarations

The compiler uses the initial assignment to infer the type. `const` declarations
must have an initializer. `var` and `let` declarations without an initializer
are allowed and start at `0`.

```javascript
const white = 0x05
var rank = 0
var text = "hello"
var a = 0, b = 1
```

All variables are currently global, even if they are declared inside a function
or block.

`const` values are stored using the same practical storage model as compatible
variables, but JASSCO rejects writes from compiled JavaScript:

```javascript
const wall = 1
const values = [1, 2, 3]
const rooms = ["", "Hall", "Kitchen"]

console.log(values[1])
console.log(rooms[2])
```

The compiler enforces read-only use from JavaScript. Inline assembly can still
write to memory directly; JASSCO does not try to protect constants at runtime.

## Arrays, Matrices, And Maps

Integer arrays:

```javascript
var values = [1, 2, 3, 4]
values[2] = 10
console.log(values[2])
```

String arrays / text tables:

```javascript
var rooms = ["", "Hall", "Kitchen"]
console.log(rooms[currentRoom])
```

String arrays must be declared with literal text values. Arrays created with
`Array(n)` are numeric arrays and cannot later receive strings:

```javascript
// Supported numeric array
var scores = Array(5)
scores[0] = 10

// Not supported
var rooms = Array(5)
rooms[1] = "Hall"
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

Arrays and matrices currently support dimensions from 1 to 255. Larger or zero
dimensions are reported as compiler errors.

Constant arrays can be declared and read, but not modified:

```javascript
const values = [7, 8, 9]
console.log(values[1])

// Not supported
values[1] = 10
```

## Empty Data Structures

JASSCO supports a few constructor-like helpers to reserve fixed-size data
structures.

```javascript
var text = String(5)     // empty string with room for 5 characters
var arr = Array(5)       // empty numeric array with 5 numbers
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

String support is intentionally small. Supported string operations include
assignment, copying, equality comparison, literal string arrays, `charAt()`,
`charCodeAt()`, `String.fromCharCode(n)`, and the console string helpers.

General string concatenation with `+` is not supported. Use separate
`console.log(...)` arguments, `console.logchar(...)`, or
`console.logstring(...)` for generated Spectrum output.

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
- Recursion supports single and multiple sibling calls when parameters are
  integer-compatible.

Example of a supported recursive pattern:

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

`read(destination)` reads keyboard input into a destination variable. `read()`
with no arguments is a statement-only keyboard pause. `read()` is not an
expression that returns a value.

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
- `text.length` returns string length for supported string variables.

Memory:

- `memory.read(address)`
- `memory.write(address, value)`
- `memory.copy(source, target, size)`

`memory.copy(...)` is the canonical block-copy method. `memory.move(...)` is
accepted as a compatibility alias. Memory method names are case-insensitive.

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

## Command-Line Options

`main.py` accepts the input file and output assembly file as positional
arguments.

Useful options:

- `--tapbas`: wrap generated assembly with the `start`/`end start` directives
  expected by `pasmo --tapbas`.
- `--quiet`: reduce console output for scripted builds.
- `--org ADDRESS`: set the generated assembly origin address. Decimal and
  Python-style hexadecimal values such as `0x8000` are accepted.

## Known Restrictions

Current major restrictions:

- No floating-point numbers.
- No full JavaScript runtime.
- No dynamic memory management.
- All variables are global.
- `var` and `let` declarations without an initializer start at `0`.
- Repeated `var` declarations are accepted for compatibility and execute their
  initializer. `let` and `const` cannot be redeclared.
- `const` requires an initializer and cannot be assigned, incremented, or
  decremented after declaration. These rules are enforced by the compiler;
  constants are not protected dynamically at runtime.
- Function parameters are integer-compatible.
- Arrays created with `Array(n)` are numeric arrays. Use literal string arrays
  for text tables.
- String support is limited.
- Objects are not generally supported, except for documented compiler patterns.
- Complex function-call arguments should be replaced with intermediate
  variables.
- Recursive calls preserve integer-compatible parameters. Function-local
  variables still use shared storage and are not reentrant.

See `docs/RESTRICTIONS.md` for the current working list of restrictions and
compatibility notes.
