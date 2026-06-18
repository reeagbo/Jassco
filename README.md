# JASSCO (JAvaSCript to ASSembly COmpiler)

JASSCO is a Python-based cross-compiler that reads a small JavaScript-like
program and generates Z80 assembly code. The current target is ZX Spectrum, but
the compiler is built around separate assembly support libraries so other Z80
machines can be explored later.

The current compiler source is visible file by file in `compiler/`. Each release
is also published as a self-contained ZIP: download it, extract it, edit
`input.js`, run the compiler, and use the generated `output.asm` with your
preferred Z80 assembler/emulator.

## Quick Start

1. Download the latest ZIP from `software/` or from the GitHub release page.
2. Extract it into a local folder.
3. Install Python and the required parser:

```powershell
pip install -r requirements.txt
```

4. Edit `input.js`.
5. Run:

```powershell
.\run_jassco.cmd
```

or:

```powershell
.\jassco.bat input.js output.asm
```

The compiler writes the generated Z80 assembly to `output.asm`.

## Current Scope

JASSCO uses JavaScript ES2 as a reference, with a deliberately small supported
subset:

- 16-bit integers, booleans, and limited strings.
- Variables and constants.
- Basic control flow: `if`, `for`, `while`, `do while`, `switch`, `break`, and
  `continue`.
- Assignments and binary expressions.
- Function declarations and calls, including numeric recursion in supported
  cases.
- A small set of explicit non-JS helpers for Z80-oriented work.

This is not a browser JavaScript runtime. It is a practical compiler for small
programs that can run on constrained Z80 machines.

## Examples and Outputs

The `examples/` folder contains working JavaScript inputs.

The `examples/outputs/` folder contains generated pairs of:

- `input.js`
- `output.asm`

These are included so users can see how the compiler translates each example
without having to run the compiler first.

## Repository Layout

- `compiler/`: source and support files for the latest published version.
- `examples/`: example JavaScript programs.
- `examples/outputs/`: generated JS/ASM pairs for inspection.
- `docs/`: release notes, restrictions, fixes, and development backlog.
- `software/`: historical self-contained release ZIPs.

The files in `compiler/` and the compiler contained in the latest release ZIP
must always represent the same version.

## Documentation

- `User Manual.md`: basic setup and first compilation walkthrough.
- `Technical Description.md`: supported JavaScript subset and implementation
  notes.
- `docs/RESTRICTIONS.md`: known compiler restrictions.
- `docs/TICKETS.md`: canonical backlog for unresolved work after the current release.
- `docs/FIXES.md`: fixes applied during the current cleanup pass.
- `docs/IMPROVEMENTS.md`: possible improvements to review later.
- `docs/RELEASE_NOTES_26.25.md`: notes for the current release.

## Releases

Release numbers use `YY.WW` format. For example, `26.22` means year 2026, week
22.

The newest release ZIP should normally be the best starting point.

## License

JASSCO is free software. See `LICENSE`.
