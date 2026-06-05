# User Manual

JASSCO compiles a small JavaScript-like program into Z80 assembly.

It produces `output.asm`. It does not directly produce a `.tap`, `.tzx`,
snapshot, or emulator image unless you add an assembler/emulator step such as
Pasmo and Fuse.

## 1. Download

Download the latest release ZIP from GitHub Releases or from the `software/`
folder.

Extract it into any folder. Each release ZIP is meant to be self-contained.

## 2. Install Python Requirements

Install Python 3 if it is not already installed.

Open a terminal in the extracted JASSCO folder and run:

```powershell
pip install -r requirements.txt
```

This installs `esprima`, the JavaScript parser used by JASSCO.

## 3. Quick Compile

The package includes `input.js`. To compile it, run:

```powershell
run_jassco.cmd
```

or:

```powershell
jassco.bat
```

JASSCO reads `input.js` and writes `output.asm`.

To choose different files:

```powershell
run_jassco.cmd my_program.js my_program.asm
```

## 4. Minimal Example

Put this in `input.js`:

```javascript
include("io.asc")

console.log("hello, world!")
```

Run:

```powershell
run_jassco.cmd
```

If compilation succeeds, open `output.asm`. It should contain Z80 assembly code.

## 5. Eclipse Workflow

This workflow is useful if you prefer editing and running Python from Eclipse.

Preparation:

- Install Python 3.
- Install the Python requirements with `pip install -r requirements.txt`.
- Configure Eclipse so it can run Python files.

Steps:

- Open the extracted JASSCO folder in Eclipse.
- Edit `input.js`.
- Open `main.py`.
- Run `main.py`.

The compiler writes the assembly to `output.asm` and also prints it to the
console.

## 6. Pasmo And Fuse Workflow

This workflow is useful if you want to go from generated assembly to something
you can run in a ZX Spectrum emulator.

JASSCO itself only generates assembly. After that, use Pasmo or another Z80
assembler.

Example manual flow:

```powershell
run_jassco.cmd input.js output.asm
pasmo.exe --tap output.asm output.tap
```

Then open `output.tap` in Fuse or another ZX Spectrum emulator.

The default generated code is intended to start at address `25000`, so the usual
BASIC entry point is:

```basic
RANDOMIZE USR 25000
```

If you want full automation, you can create your own batch file that runs
JASSCO, Pasmo, and Fuse in sequence. Paths depend on where you installed Pasmo
and Fuse.

## 7. Examples

The repository includes example programs in `examples/`.

For each example, `examples/outputs/` includes the matching generated
`output.asm` so you can inspect the translation without running the compiler.

## 8. Main Files In The Release ZIP

- `main.py`: compiler entry point.
- `translator.py`: JavaScript AST to Z80 assembly translation.
- `utils.py`: shared compiler helpers.
- `config.py`: compiler configuration and shared state.
- `*.asc`: Z80 assembly support libraries.
- `input.js`: default source file.
- `output.asm`: default generated output file.
- `run_jassco.cmd` / `jassco.bat`: Windows launchers.
- `requirements.txt`: Python dependencies.

## Notes

JASSCO supports only a small, documented subset of JavaScript. See
`Technical Description.md` and `docs/RESTRICTIONS.md` for details.
