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

Harmless whitespace around the include call is accepted:

```javascript
// jassco: include ("io.asc")
// jassco: include( "io.asc" )
// jassco: include ( "io.asc" );
```

Requested support libraries are collected during translation and emitted in the
generated assembly support-library section before `mai_cod`. They are not
inserted inline at the JavaScript source position. Use inline assembly blocks
for code that must appear in the executable flow.

## Startup Code

Every generated ZX Spectrum assembly file starts with the configured origin,
then inserts the compiler's `startup.asc` file before variable declarations,
support libraries and generated program code.

The default `startup.asc` opens ROM channel 2, then transfers control to the
generated main-code label:

```asm
ld a,2
call 5633
jp mai_cod
```

When `--tapbas` is used, the compiler emits the `start` label before this
startup block and still emits `end start` at the end of the file. Startup code
is target-level assembly, not JavaScript API surface. Custom startup variants
can change the initial ROM channel or add target setup, but they must eventually
transfer control to `mai_cod` unless they intentionally replace the generated
program flow.

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
variables, but JASSCO rejects reassignment of the declared identifier from
compiled JavaScript:

```javascript
const wall = 1
const values = [1, 2, 3]
const rooms = ["", "Hall", "Kitchen"]

console.log(values[1])
console.log(rooms[2])
```

For arrays and text tables, `const` protects the base identifier, not the
contents behind it. This follows the useful JavaScript rule for fixed buffers:

```javascript
const values = Array(10)
values[0] = 5      // supported
values = Array(20) // compiler error
```

Inline assembly can still write to memory directly; JASSCO does not try to
protect constants at runtime.

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

One-dimensional arrays use a 16-bit length header and currently support lengths
from 1 to 32767. Matrices use byte-sized dimensions and support dimensions from
1 to 255. Zero or oversized dimensions are reported as compiler errors.

Constant arrays keep a fixed identifier, but their elements can be modified:

```javascript
const values = [7, 8, 9]
console.log(values[1])

// Supported
values[1] = 10

// Not supported
values = [1, 2, 3]
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

`String(n)` is a JASSCO-specific extension. It reserves a mutable string buffer
with room for `n` characters. It does not follow standard JavaScript
`String(n)` semantics, where `String(20)` would produce the text `"20"`.
Because `String(n)` reserves mutable storage, it is only supported with `var`.
Use a string literal for `const` text:

```javascript
var text = String(20)     // supported mutable buffer
const title = "HELLO"     // supported constant text
const text = String(20)   // compiler error
```

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

- Function parameters are stored in generated function-scoped slots.
- Regular calls infer simple parameter types from literal arguments. Integer,
  boolean and one-character arguments remain integer-compatible; multi-character
  string literals and supported string-producing calls are treated as strings.
- Before a regular call overwrites a parameter slot, the generated code saves
  the caller's slot in the auxiliary stack area and restores it on return.
- Function parameter symbols are scoped by function in generated assembly. For
  example, `function paper(n)` and `function ink(n)` use separate generated
  symbols such as `fn_paper_n_` and `fn_ink_n_`.
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

Generated assembly is formatted before it is written. Labels are emitted
without trailing colons, and labels, opcodes, operands and comments are aligned
in stable columns. Raw assembly content should still be written in the style
the target assembler accepts.

`eval` is reserved internally by the compiler and should not be used as normal
JavaScript.

## Console And Input Helpers

`console.log()` is supported for common output cases.

Additional console helpers:

- `console.logstring(value)`: print a string without line feed.
- `console.lognumber(value)`: print a number.
- `console.logchar(value)`: print a character/byte.
- `console.clear()`: clear the screen using the ROM routine.

The default ZX Spectrum startup code opens channel 2 once. The print helpers
then use the active channel, which lets ROM control codes such as INK (`16`),
PAPER (`17`) and AT (`22`) persist across consecutive console calls.

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
- `document.createElement(...)`
- `document.body.appendChild(...)`
- `canvas.getContext("2d")`
- `ctx.beginPath()`
- `ctx.closePath()`
- `ctx.moveTo(x, y)`
- `ctx.lineTo(x, y)`
- `ctx.stroke()`
- `ctx.clearRect(...)`
- `ctx.clearScreen()`

`beginPath()`, `closePath()` and `stroke()` are recognized no-ops so common
Canvas examples can compile. `moveTo()` updates the current point without
drawing, while `lineTo()` draws immediately from the current point to the new
one. `clearRect(...)` ignores its rectangle arguments and clears the full ZX
Spectrum screen. `fill()` is intentionally rejected because filled shapes are
not supported. Contexts other than `"2d"` are rejected so code that compiles
with JASSCO also follows browser Canvas behavior.

Canvas coordinates match browser behavior: `(0, 0)` is the top-left corner,
X grows to the right and Y grows downward.

For JavaScript that also runs in a browser, create the canvas if the page does
not already provide one:

```javascript
var canvas = document.getElementById("myCanvas")
if (canvas == null) {
    canvas = document.createElement("canvas")
    document.body.appendChild(canvas)
}
var ctx = canvas.getContext("2d")
```

JASSCO treats the DOM creation calls as no-ops and only keeps a small
placeholder for comparisons such as `canvas == null`.

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

## Configuration Settings

Some target-specific values live in `config.py`. They are not command-line
options, and changing them changes the generated assembly layout. After any
change, rebuild the affected programs and run the golden/Pasmo validation.

Current practical settings:

- `string_max_length = 32`: fixed record size used by string arrays/text tables.
  The value is the maximum number of text characters per entry. Each generated
  record also stores two length bytes, so the assembly record size is
  `string_max_length + 2`. Increasing it gives text-table entries more room and
  uses more memory. Reducing it is only safe if every string-array entry still
  fits; otherwise compilation fails.
- `initial_address = 25000`: default `org` address for generated code. Prefer
  `--org` for normal builds so the source tree does not need editing.
- `stack2_address = 24500`: auxiliary stack area used by generated function-call
  support.
- `garbage_address_start = 24000` and `garbage_address_end = 24200`: temporary
  workspace used by helper operations such as input conversion, random values,
  character extraction and short generated strings.
- `assembly_lib_path = "./"`: default support-library lookup base used by the
  compiler.

These memory areas must not overlap the generated program, user data, BASIC
loader area, or any custom assembly buffers used by the application.

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
  decremented after declaration. For arrays and text tables, the identifier
  cannot be reassigned but elements may be updated. These rules are enforced by
  the compiler; constants are not protected dynamically at runtime.
- Function parameters support simple inferred integer-compatible and string
  slots for regular calls.
- Arrays created with `Array(n)` are numeric arrays. Use literal string arrays
  for text tables.
- String support is limited.
- Objects are not generally supported, except for documented compiler patterns.
- Complex function-call arguments should be replaced with intermediate
  variables.
- Recursive calls preserve parameter slots for regular calls. Function-local
  variables still use shared storage and are not reentrant.

See `docs/RESTRICTIONS.md` for the current working list of restrictions and
compatibility notes.
