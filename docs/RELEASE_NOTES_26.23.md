# Release Notes 26.23

Status: closed compiler baseline.

## Compiler Fixes

- Resolve previously declared integer constants inside numeric array literals.
- Generate declarations and initialization code for numeric 2D matrix literals.
- Support arrays and matrices whose first value is a negative integer literal.
- Restore the symbolic `board` array in the chess example without leaving `board_` undefined.
- Generate the previously missing neural and testplan matrix declarations.

## Tooling

- Add `--tapbas` to generate the `start:` label and `end start` directive required by Pasmo `--tapbas`.
- Validate every golden output with Pasmo in addition to comparing generated ASM.
- Locate Pasmo through `--pasmo`, `JASSCO_PASMO`, a project-local executable, or the system `PATH`.
- Use the Python interpreter running the test script instead of a user-specific Python path.

## Documentation

- Expand the User Manual with installation, direct CLI use, Pasmo, TAPBAS, Fuse, Eclipse, troubleshooting, and release contents.

## Verification

- All current golden examples match their approved ASM.
- All current TAPBAS outputs assemble successfully with Pasmo and produce TAP files.
