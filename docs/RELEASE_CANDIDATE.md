# Release Candidate Checklist

## Status

- Golden ASM output is unchanged for all current reference programs.
- Compiler diagnostics now distinguish fatal errors from compatibility warnings.
- Known restrictions and future semantic changes are tracked separately from applied fixes.

## Final Golden Test Result

- `simple_clock_jassco.js`: pass
- `squares_jassco.js`: pass
- `sierpinski_jassco.js`: pass
- `neural v2.0 hidden layer.js`: pass
- `G-Shock DCF77 decoder.js`: pass
- `chesskelet_jassco.js`: pass
- `testplan.js`: pass

## Remaining Known Non-Blocking Items

- Complex function-call arguments may warn because some cases are known assembler-side restrictions, but current working examples still compile to the same ASM.
- Repeated variable declarations remain compatibility warnings.
- Full recursive frames for multiple sibling recursive calls are not implemented yet.
- `Memory.move(...)` behavior needs semantic review against `memory.copy(...)`.
- 2D matrix literal behavior may be improvable, but changing it alters golden output.

## Recommended Release Contents

- `src/` or compiler source directory
- `examples/`
- `examples/outputs/` with JS/ASM pairs for user inspection
- `golden/`
- `tests/`
- `docs/`
- `FIXES.md`
- `IMPROVEMENTS.md`
- `RESTRICTIONS.md` once extracted from docs/release notes
