# Release Notes 26.24

Status: working version, not yet released.

## Baseline

- Created from the closed 26.23 compiler baseline.

## Current 26.24 Changes

- Add a consolidated validation workspace without duplicate example and output trees.
- Add validation launchers for JASSCO, Pasmo and the complete `run_jassco_pasmo.cmd` flow.
- Add `--quiet` so scripted compilation keeps warnings visible without printing the full ASM to the terminal.

## Compiler Fixes

- Generate assignments to nested matrix elements such as `matrix[row][column] = value`; these assignments were previously omitted completely.
- Make `Array.fill()` write both bytes of every 16-bit integer element and support the full literal 16-bit value.
- Clear the Z80 carry flag before compound subtraction (`-=`).
- Keep function declarations outside the executable flow while preserving every top-level statement, including statements written before or between function declarations.
- Execute the initializer of a repeated variable declaration without allocating the variable a second time.
- Implement `String.charAt()` and fix `String.charCodeAt()` so both use the string content pointer correctly.

## Example And Test Fixes

- Fix chess move storage, valuation, selection and board updates by restoring the missing writes to `move_list`.
- Remove the invalid `key = read(dkey)` expression from the chess example; keyboard input continues through the existing event loop.
- Correct string-variable typos and misleading console text in `testplan.js`.
- Add an explicit newline after the console methods that intentionally print without a carriage return.
- Make the bitwise tests initialize redeclared variables correctly and exercise `<<`, `>>` and `>>>` as labelled.

## Verification Framework Inherited From 26.23

- Golden ASM comparison.
- Pasmo assembly validation and TAP generation.
- Portable Python and Pasmo discovery.

## Verification

- Chess was tested manually: candidate generation, valuation, move selection and board movement work correctly.
- The complete interactive `testplan.js` was reviewed and approved for this release.
- Updated outputs assemble successfully with Pasmo.

Further changes may be added before 26.24 is packaged or published.
