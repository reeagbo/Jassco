# JASSCO 26.22

This release focuses on compiler reliability while preserving the generated ASM for all current working examples.

## Highlights

- Golden ASM output is unchanged for the current reference examples and `testplan.js`.
- Compiler diagnostics now separate fatal errors from compatibility warnings.
- Compiler state reset, include resolution, main-label placement, and missing ASM routine detection were fixed.
- Known restrictions are now documented and surfaced through warnings/errors where possible.
- `outputs/` includes JS/ASM pairs so users can inspect how examples are translated.

## Verified Examples

- `simple_clock_jassco.js`
- `squares_jassco.js`
- `sierpinski_jassco.js`
- `neural v2.0 hidden layer.js`
- `G-Shock DCF77 decoder.js`
- `chesskelet_jassco.js`
- `testplan.js`

## Known Non-Blocking Items

- Complex function-call arguments may warn because some assembler-side cases are known restrictions.
- Repeated variable declarations remain compatibility warnings.
- Multiple sibling recursive calls in the same function level are not supported yet.
- `Memory.move(...)` behavior needs semantic review against `memory.copy(...)`.
- Some 2D matrix literal behavior may be improvable, but changing it currently alters golden ASM output.
