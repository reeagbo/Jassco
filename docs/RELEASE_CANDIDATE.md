# Release Candidate Checklist

## Status

- Golden ASM output has been reviewed and accepted for all current reference
  programs.
- Compiler diagnostics now distinguish fatal errors from compatibility warnings.
- Known restrictions and future semantic changes are tracked separately from applied fixes.

## Final Golden Test Result

- `basic_assembly_jassco.js`: pass
- `simple_clock_jassco.js`: pass
- `squares_jassco.js`: pass
- `sierpinski-full.js`: pass
- `neural-digit-reco.js`: pass
- `G-Shock DCF77 decoder.js`: pass
- `chesskelet_jassco.js`: pass
- `testplan.js`: pass

## Remaining Known Non-Blocking Items

- Complex function-call arguments may warn because some cases are known assembler-side restrictions, but current working examples still compile to the same ASM.
- Repeated variable declarations remain compatibility warnings.
- Full recursive frames for multiple sibling recursive calls are not implemented yet.
- `Memory.move(...)` behavior needs semantic review against `memory.copy(...)`.
- 2D matrix literal behavior may be improvable, but changing it alters golden output.

## Repository And Release Layout

- Keep the latest published compiler visible file by file in `compiler/`.
- Keep examples and generated JS/ASM pairs in `examples/` and
  `examples/outputs/` in the repository.
- Build the self-contained release ZIP from the approved contents of
  `compiler/`.
- Add `release notes.txt`, the main documentation, `LICENSE`, and the public
  `docs/` material to the ZIP.
- Do not include examples, outputs, golden references, validation files,
  `FIXES.md`, `testplan.js`, `output.asm`, or Python cache files in the ZIP.
- Before commit, verify that `compiler/` and the ZIP contain the same compiler
  source files.
