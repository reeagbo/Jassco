Release notes

26.26 (22/06/26)
----------------
Status
- Released version based on the closed 26.25 release.

Fixes
- Const: constant declarations now follow the intended JASSCO contract. The
  declared name cannot be reassigned, incremented or decremented, while array
  elements remain writable so fixed buffers such as `const keys = Array(40)`
  stay useful on ZX Spectrum.
- Console: generated programs open the ZX Spectrum upper screen channel once in
  the default startup code. Print helpers no longer reopen the channel for every
  string or number, so control codes such as INK, PAPER and AT can persist
  across console calls.
- Functions: different functions can reuse the same parameter names. JASSCO now
  generates function-scoped parameter symbols such as `fn_paper_n_` and
  `fn_ink_n_`.
- Includes: the JavaScript-compatible include directive accepts harmless
  whitespace variations such as `include ("io.asc")` and
  `include( "io.asc" )`.
- Startup: the default ZX Spectrum startup code now lives in `startup.asc`
  instead of being hard-coded in the compiler header.
- Timer: `setInterval(...)` now reloads the countdown from the configured
  `int_tik` value instead of hard-coding 50 ticks after the first trigger.

Features
- Canvas: `getContext("2d")` creates the internal canvas object; other context
  values are rejected to match browser behavior. `beginPath()`, `closePath()`
  and `stroke()` are recognized no-ops with generated ASM comments,
  `clearRect(...)` clears an exact masked rectangle in the ZX bitmap, and
  `fill()` is rejected clearly because filled shapes are not supported.
- Canvas/browser compatibility: `document.getElementById(...)` now creates a
  small DOM element placeholder in generated ASM. `document.createElement(...)`
  assignments and `document.body.appendChild(...)` are accepted as no-ops so
  browser-safe canvas fallback code can compile for ZX Spectrum too.
- Graphics: `graph.asc` now uses Canvas-compatible Y coordinates. `y=0` is the
  top of the screen and larger Y values move downward, matching browser Canvas
  instead of flipping Y internally.
- Graphics: line drawing now uses an iterative Bresenham routine for all
  octants instead of the previous recursive divide-and-conquer implementation.
- Graphics: Bresenham line drawing uses an internal fast plot path, avoiding
  the register-preserving overhead of the general `plo_poi` routine per pixel.
- Graphics: Bresenham now inlines its X/Y stepping paths inside the major-axis
  loops, removing the helper calls from the per-pixel path.
- Const: `String(n)` is rejected with `const` because it reserves mutable
  JASSCO string storage. Use `var String(n)` for buffers or a literal for fixed
  text.
- Strings: `String(n)` is documented as a JASSCO extension for reserving a
  mutable string buffer with room for `n` characters.
- Strings: `string_max_length` now means maximum text characters per string
  table entry. JASSCO validates text tables and fails compilation if an entry
  does not fit.

Validation
- Add focused canvas compatibility validation for `getContext(...)`,
  `beginPath()`, `moveTo()`, `lineTo()`, `stroke()`, `closePath()`,
  `clearRect(...)` and rejected `fill()`.
- Add focused validation for rejected canvas contexts other than `"2d"`.
- Add focused validation for browser-safe canvas creation fallback code.
- Add an initial 3D wireframe cube probe that projects 3D vertices to 2D
  canvas-style lines and assembles successfully with Pasmo.
- Add a first interactive 3D probe: W/S move the camera on the Z axis, Q exits
  the keyboard loop, and each accepted key clears and redraws the cube.
- Extend the interactive 3D probe with vector-based camera controls: W/S move
  forward/back, A/D strafe, J/L turn and Q exits the keyboard loop.
- Stabilize the interactive 3D probe turn controls with a 64-step sine table
  scaled to 64, using a quarter-table offset to derive cosine.
- Tune the interactive 3D probe perspective by moving the cube farther from
  the camera while increasing FOV, preserving cube dimensions but reducing
  apparent depth exaggeration during turns.
- Increase the interactive 3D probe linear movement step to better balance
  W/S/A/D displacement against the 64-step angular turn controls.
- Use arithmetic shifts in the interactive 3D probe camera movement instead
  of division by 8, avoiding general division calls in the key handler.
- Extend the interactive 3D probe scene with additional wireframe geometry:
  a pyramid and a rectangular prism alongside the original cube.
- Avoid unnecessary redraws in the interactive 3D probe by clearing and
  rendering only when a recognized movement or turn key changes the camera.
- Add `graph3d.asc` as a forked wireframe-oriented graphics backend so 3D
  experiments can evolve independently from the general 2D `graph.asc` library.
- Add `graph3d.asc` line fast paths for horizontal, vertical and perfect
  diagonal segments before falling back to the general Bresenham routine.
- Optimize `graph3d.asc` horizontal lines by drawing masked edge bytes and
  filling complete screen bytes directly instead of plotting pixel by pixel.
- Refactor the interactive 3D probe into clearer engine/demo pieces:
  projection, edge drawing, forward/strafe camera movement and turn handling,
  while keeping flat arrays and direct render loops for ZX performance.
- Replace the interactive 3D probe camera-space divisions by 64 with
  arithmetic shifts, cutting two general division calls from each projected
  vertex.
- Add a focused Bresenham line probe that draws horizontal, vertical and
  diagonal lines across all octants.
- Add focused validation for constant scalar literals, const array element
  writes, const Array(n) element writes, const reassignment failures and
  const String(n) rejection.
- Add focused validation for string table entries at and above
  `string_max_length`.
- Add focused validation coverage for INK/PAPER control codes followed by
  string output.
- Add testplan and focused validation coverage for functions that reuse the
  same parameter name.
- Add focused include directive tests for whitespace before the parenthesis,
  inside the parenthesis and before a trailing semicolon.

26.25 (18/06/26)
----------------
Status
- Released version based on the closed 26.24 release.

Fixes
- Arrays: programs now fail early when an array or matrix is larger than the current supported size, instead of producing assembly that Pasmo cannot assemble safely.
- Arrays: assigning text to arrays created with Array(n) now fails with a clear compiler error. Use a literal string array such as ["", "Hall"] when you need a text table.
- Program exit: programs that compare strings now finish cleanly instead of failing when execution returns to BASIC.
- read(): existing programs that use read(variable) continue to compile, while unsupported ways of using read() now report a clear compiler error.
- Signed comparisons: comparisons with negative numbers now behave as expected. This fixes common code such as ReLU checks written as `if (sum < 0)`.
- Strings: string concatenation with + is now rejected clearly. Use separate console.log arguments, console.logchar(), or console.logstring() for Spectrum output.
- Switch: switch statements now choose the correct case, handle default reliably regardless of where it appears, support the usual "continue into the next case when there is no break" behavior, and keep break from leaving unrelated loops.

Features
- Const arrays: const arrays can now be declared and read like regular arrays, while JASSCO rejects attempts to modify them from compiled JavaScript.
- Includes: library includes now use JavaScript-compatible comment directives, for example `// jassco: include("io.asc")`.
- Org: `--org` lets you choose the generated assembly origin address without editing the compiler.
- read(): read() with no arguments can now be used as a simple keyboard pause.
- Strings: String.fromCharCode(n) can now create a one-character string for assignment and printing.

Validation
- Add a minimal golden example combining basic JavaScript, an io.asc include and labelled inline assembly.
- Replace the original Sierpinski golden case with the full recursive Sierpinski program used to validate sibling recursive calls.
- Replace the smaller neural golden with the larger neural-digit-reco case and validate its ReLU path with the normal `sum < 0` comparison.
- Add focused compiler and Pasmo tests for read() pause behavior and invalid expression use.
- Add focused switch tests covering matched cases, no match, default placement, fall-through, break and switch inside a loop.
- Add negative compiler tests for oversized and zero-sized arrays and matrices.
- Add negative compiler tests for modifying const arrays and assigning strings to numeric Array(n) arrays.
- Add testplan coverage for reading numeric and string const arrays.
- Validate the JavaScript-compatible include directive and reject the legacy include("...") form.
- Validate --org with decimal and hexadecimal addresses and reject addresses outside 0..65535.
- Validate read(), the complete switch semantics and the full interactive testplan manually in the emulator.
- Validate the string-comparison stack fix with an instrumented testplan; the final stack delta is 0 and the program returns cleanly.
- Validate String.fromCharCode() and negative string-concatenation cases; prefer console.log arguments, console.logchar() and console.logstring() for Spectrum output.
- Keep testplan.js unchanged for read(variable) compatibility.
- Regenerate testplan ASM/TAP and pass all eight golden tests with Pasmo.

26.24 (11/06/26)
Status
- Created from the closed 26.23 compiler baseline.
Fixes
- Nested matrix element assignments are generated instead of being silently omitted.
- Array.fill() writes complete 16-bit integer elements.
- Compound subtraction clears carry before SBC.
- Top-level statements remain executable regardless of where functions are declared.
- Repeated variable declarations execute their initializer without allocating duplicate storage.
- String.charAt() is implemented and String.charCodeAt() uses the correct content pointer.
- Chess stores and reads its candidate moves correctly and no longer uses key=read(dkey).
- Testplan string, console and bitwise test errors were corrected.
- Multiple sibling recursive calls preserve integer-compatible parameters.
- memory.copy() now dispatches to mem_cop; Memory.move() is a compatibility alias.
- Unknown memory methods and invalid memory-method argument counts fail compilation.
- var and let declarations without initializers start at 0.
- const requires an initializer and cannot be modified; let/const redeclarations fail.
- Repeated var declarations remain supported for compatibility.
Features
- Added consolidated validation launchers for JASSCO and Pasmo.
- Added the optional --quiet flag for scripted compilation.
Verification
- Chess move generation, valuation, selection and board update were tested manually.
- The complete interactive testplan was reviewed and approved.
- Updated outputs assemble successfully with Pasmo.
- Fibonacci, three-branch recursion, and recursive Sierpinski were tested in an emulator.
- memory.copy(), Memory.move(), and declaration rules were tested in an emulator.

26.23 (11/06/26)
Fixes
- Numeric arrays can use previously declared integer constants as elements.
- Numeric 2D matrix literals are declared correctly.
- Arrays and matrices whose first value is negative are declared correctly.
- The chess example again uses symbolic piece constants in the board array.
- Neural and testplan matrix declarations no longer leave undefined symbols.
Features
- Added the optional --tapbas flag to generate the start/end directives required by Pasmo --tapbas.
Verification
- Golden outputs are compared automatically.
- Every current golden output is also assembled with Pasmo and produces a TAP file.
- Pasmo can be selected by command-line option, environment variable, project-local copy, or system PATH.
Documentation
- Expanded the User Manual with Python, Pasmo, TAPBAS, Fuse, Eclipse, and troubleshooting workflows.

26.22 (06/06/26)
Fixes
- Compiler state reset is now applied to the shared state used by the translator.
- Include files are resolved relative to the input file and compiler directory.
- Main-code label placement no longer clears the last generated node line.
- Missing assembly routines are detected and reported.
- Compiler diagnostics now distinguish errors from warnings.
- Several previously silent unsupported cases now log warnings or errors.
- Known restrictions for const arrays and complex function-call arguments are reported.
- Golden ASM output is unchanged for all current reference examples and testplan.
Restrictions
- Arrays need to be variables. Constants are not supported.
- Complex function-call arguments may need to be assigned to a variable first.
- Multiple sibling recursive calls at the same function level are not supported.
Documentation
- Added FIXES, IMPROVEMENTS, RESTRICTIONS, and RELEASE_CANDIDATE notes.

25.44 (27/10/25)
Fixes
- Wrong declaration of boolean variables.
Restrictions
- Arrays need to be variables. Constants not allowed.
- Can´t use complex expressions as funtion call parameters. Example:
  receive_bit(input_bits[input_bits_pointer])
  Only supported as:
  send_bit= input_bits[input_bits_pointer]
  receive_bit(send_bit)

25.31 (29/07/25)
Features
- String handling finally re-written (nowbased on immutable strings) and enhanced:
	- String creation: var txt1= "" 
	- String assignment: txt1= "hello"
	- Strings comparison: txt1 == txt2
	- String arrays: var cars = ["Saab", "Volvo", "Pegaso"];

25.21 (21/05/25)
Features
- Arrays, matrices and strings are now assigned during declaration too. This is needed in case the code passes a 2nd time through the declaration of the element.
- Arrays can now be declared as:
  array = [0, 1]
Fixes
- Minor corrections and improvements in python code.
Documentation
-

25.19 (v1.0, 05/05/25)
Features
- Basic timer handling via setInterval/clearInterval methods (see technical description for details).
Fixes
- RAM usage improved by 10%-11% via optimization of literals translation to assembly (Identifiers, literal numbers, charCodeAt, Unary expressions, bitwise operations, arithmetical operations, logical opearations, math.random)
Other
- charAt method removed.
Documentation
- setInterval/clearInterval documented.
- minor enhancements in User Guide.

25.17 (23/04/25)
Features
- Additional debugging help in assembly code.
Fixes
- Continue instruction failing with While and DoWhile.
- Code clean-up.
Documentation
- Technical desription updated accordingly.
- Examples folder added in github. 

25.15 (13/04/25)
Features
- Added a "set_env" routine to the io.asc file to allow for screen system initialization.
- "EmptyStatemnt" expression handler added. It deals mostly with misplaced semicolons in JS.
Fixes
- all breaks (for/while/dowhile) reworked. It would not work properly any many nested structures.
- "<" operation assembly simplified.
- console.log fixed for 1-char strings.
Documentation
-

25.13 (29/03/25)
Features
- Logical operations (&&, ||, !) implemented.
- Constant handling improved: now they can't be altered, loaded in memory on every pass.
- new "console.clear" method to clear screen. Different from canvas.clearScreen as it clears attributes too.
- improved array/matrix declaration, using "defs" to book space in memory.
Fixes
- if/while/dowhile/for not releasing stack resources in some cases.
Documentation
- Technical desription updated accordingly.

25/03/18
- known objects and methods are not case sensitive anymore.
- kew "memory" object with methods to read, write memory positions and copy blocks (see technical description).
- recursion improved. Known restriction: function with several recursive calls within the function will not work.

25/02/28
- Math.Random function improved. It used to produce ascending numbers.
- multiple declarations in one line. Example:
	var num1=0, num2=0
- final solution for nested loops. In previous versions, some cases would not work.

25/02/23
- new methods for console to print strings and numbers in screen (console.logstring, ,console.lognumber, console.logchar)
- characters are now supported in dictionaries.
- nested loops have been improved.
- empty strings can be created.
- keydown event listener is now supported.
- ChatAt and CharCodeAt methods for String are now supported.
