# User Manual

JASSCO translates a supported subset of JavaScript into Z80 assembly. Its main
output is an `.asm` file that can be inspected, assembled with Pasmo, or used
with another Z80 toolchain.

JASSCO is intentionally small. You do not need to install it system-wide: each
release ZIP contains the compiler, its assembly libraries, launchers and
documentation.

## 1. Download And Preparation

1. Download the latest release ZIP from GitHub Releases or the `software/`
   folder.
2. Extract it into a folder where you have write permission.
3. Install Python 3 if it is not already available.
4. Open a terminal in the extracted folder and install the requirement:

```powershell
python -m pip install -r requirements.txt
```

On Windows, this alternative normally works too:

```powershell
py -3 -m pip install -r requirements.txt
```

The requirement is `esprima`, which JASSCO uses to parse JavaScript source.

Use the same Python command for installation and compilation. For example, if
the launcher uses `py -3`, install the requirement with `py -3 -m pip ...`.

Pasmo is not included in the JASSCO ZIP. Install it separately if you want to
validate the generated assembly or create TAP files. It may be placed anywhere;
either add its directory to `PATH` or use the complete path to `pasmo.exe`.

## 2. First Compilation

The release contains a default `input.js`. Compile it with either launcher:

```powershell
.\run_jassco.cmd
```

or:

```powershell
.\jassco.bat
```

Both commands read `input.js` and create `output.asm` in the same folder.

To select different filenames:

```powershell
.\run_jassco.cmd my_program.js my_program.asm
```

The launchers first try the Windows `py -3` command and then fall back to
`python`.

The launchers accept only the input and output filenames. They generate normal
ASM and do not forward `--tapbas` or `--quiet`. Use `main.py` directly for those
options.

The launchers change to the extracted JASSCO directory before running. Relative
input and output paths are therefore resolved from that directory. Put paths
containing spaces inside quotes:

```powershell
.\run_jassco.cmd "C:\My Programs\clock.js" "C:\My Programs\clock.asm"
```

The parent directory of an output path must already exist. JASSCO creates the
ASM file, but it does not create missing folders.

## 3. Running Python Directly

You can call the compiler without a launcher:

```powershell
python main.py input.js output.asm
```

The two filenames are optional. Without them, JASSCO uses `input.js` and
`output.asm`.

The compiler prints diagnostics to the terminal. Fatal unsupported constructs
stop compilation; tolerated compatibility cases are reported as warnings.

For scripts or batch processes, suppress the complete ASM listing while keeping
diagnostics visible:

```powershell
python main.py input.js output.asm --quiet
```

`--quiet` affects only console output. The generated ASM file is unchanged.

JASSCO overwrites the requested ASM only after a successful compilation. If a
compilation fails, an older ASM file with the same name may still exist. Check
the exit status and do not pass that old file to Pasmo.

## 4. Minimal Program

Create or replace `input.js` with:

```javascript
include("io.asc")

console.log("Hello from JASSCO")
```

Then run:

```powershell
.\run_jassco.cmd
```

Open `output.asm` to inspect the generated Z80 code. The `include()` call adds
the assembly support library needed by `console.log()`.

JASSCO resolves an included `.asc` file from the current directory, beside the
input JavaScript file, or beside `main.py`. This means the libraries supplied
in the release are found automatically, while a custom library may be kept
beside your own JavaScript source.

## 5. Pasmo Workflow

Pasmo is optional. JASSCO can generate assembly without it, but Pasmo is useful
for checking that the generated source is valid Z80 assembly and for creating a
Spectrum TAP file.

Pasmo may be installed anywhere. You can:

- Add its folder to the system `PATH` and run `pasmo` directly.
- Call it using its complete path.
- Keep it in a tools folder beside your JASSCO installation.

Confirm that a Pasmo executable on `PATH` is available before compiling:

```powershell
Get-Command pasmo
```

If Windows cannot find it, use its full path in every Pasmo command.

### Recommended JASSCO To TAP Chain

For normal emulator use, the simplest route is an auto-starting TAPBAS file:

```powershell
python main.py input.js output.asm --tapbas --quiet
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

pasmo --tapbas output.asm output.tap
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
```

If your Python installation uses the Windows launcher, replace `python` with
`py -3` in the command above.

The exit checks are intentional. They prevent Pasmo from assembling an old
`output.asm` after a failed JASSCO compilation.

To use Pasmo from another location:

```powershell
& "C:\Tools\pasmo\pasmo.exe" --tapbas output.asm output.tap
```

Pasmo can optionally write a symbol file as its final argument:

```powershell
pasmo --tapbas output.asm output.tap output.symbols
```

The ASM support libraries requested by `include(...)` are embedded into the
generated ASM by JASSCO. Pasmo therefore needs only `output.asm`; it does not
need separate copies of `io.asc`, `graph.asc`, or the other libraries.

### Normal TAP

Generate ordinary assembly:

```powershell
python main.py input.js output.asm
```

Then assemble it:

```powershell
pasmo --tap output.asm output.tap
```

If Pasmo is not in `PATH`, use its full path:

```powershell
& "C:\Tools\pasmo\pasmo.exe" --tap output.asm output.tap
```

This creates a code-only TAP without an auto-starting BASIC loader. Load the
code block and then start the generated program, which normally begins at
address `25000`:

```basic
LOAD "" CODE
RANDOMIZE USR 25000
```

Use this route when you specifically want a code-only TAP. For a file that is
easier to load directly in an emulator, use TAPBAS instead.

### Auto-starting TAPBAS

Pasmo's `--tapbas` format needs an entry label and an `end` directive. JASSCO
can add both automatically:

```powershell
python main.py input.js output.asm --tapbas
```

This changes only the assembly wrapper required by Pasmo:

```asm
start:  jp mai_cod
```

and, at the end:

```asm
end start
```

Now create the auto-starting TAP:

```powershell
pasmo --tapbas output.asm output.tap
```

This replaces the old external post-processing step that manually inserted
`start:` and `end start`.

Do not mix the formats: ASM generated with JASSCO `--tapbas` must be assembled
with Pasmo `--tapbas`. Normal ASM should be assembled with Pasmo `--tap`.

## 6. Fuse Or Another Emulator

After Pasmo creates `output.tap`, open that file in Fuse or another ZX Spectrum
emulator.

A manual sequence is:

```powershell
python main.py input.js output.asm --tapbas
pasmo --tapbas output.asm output.tap
```

Then load `output.tap` in the emulator. JASSCO does not require Fuse and does
not assume where an emulator is installed.

With TAPBAS, the TAP contains the BASIC loader generated by Pasmo and should
start the machine-code program through its `start` entry point. Emulator tape
loading settings still depend on the emulator being used.

## 7. Eclipse Workflow

Eclipse is optional. It can be convenient if you prefer editing JavaScript and
running Python from an IDE.

Preparation:

1. Install Python 3 and `esprima` as described above.
2. Install/configure Python support in Eclipse.
3. Open the extracted JASSCO folder as a project.

To compile:

1. Edit `input.js` or add your own `.js` file.
2. Open the run configuration for `main.py`.
3. Add the input and output filenames as program arguments when needed.
4. Add `--tapbas` as a third argument when preparing assembly for Pasmo
   `--tapbas`.
5. Run `main.py` and review both the console diagnostics and generated ASM.

Example arguments:

```text
my_program.js my_program.asm --tapbas
```

## 8. Examples And Generated Outputs

The GitHub repository contains source examples under `examples/`. Their
generated assembly is available under `examples/outputs/`, so you can compare a
JavaScript input with its Z80 translation.

Examples and generated outputs are repository material; they are not duplicated
inside every release ZIP.

## 9. Common Problems

### Python is not found

Install Python 3 and make sure either `python` or the Windows `py` launcher is
available in the terminal.

### `No module named esprima`

Run:

```powershell
python -m pip install -r requirements.txt
```

Use the same Python installation that runs JASSCO.

### Pasmo is not found

Use the full executable path or add its directory to `PATH`. Pasmo is not
required merely to generate `output.asm`. JASSCO does not search for Pasmo or
invoke it automatically in the release package.

### Pasmo assembles an old file after a compiler error

JASSCO writes the output file only after successful translation. A previous
`output.asm` may remain on disk when a later compilation fails. Stop the chain
when JASSCO returns an error, or remove old outputs before rebuilding.

### Pasmo reports `ERROR: File ... not found`

Run the command from the extracted JASSCO folder or use quoted absolute paths
for both input and output. In PowerShell, an executable path containing spaces
must be invoked with `&`:

```powershell
& "C:\My Tools\pasmo.exe" --tapbas "C:\Build\output.asm" "C:\Build\output.tap"
```

The parent folders for the ASM, TAP, and optional symbols file must already
exist.

### The TAP loads but does not start

Check that both stages use the same format. The recommended pair is JASSCO
`--tapbas` followed by Pasmo `--tapbas`. A normal `--tap` file is code-only and
must be loaded with `LOAD "" CODE` and started with `RANDOMIZE USR 25000`.

### The TAP runs at the wrong address

The default origin and entry address are `25000`. If `config.py` is changed,
use the same address when manually starting a code-only TAP.

### Pasmo reports an undefined symbol

Check the complete Pasmo message and line number. A current JASSCO golden test
must both match its reference ASM and assemble successfully with Pasmo. Please
report the JavaScript input, generated ASM and exact Pasmo error.

### A JavaScript expression is rejected

JASSCO implements a deliberately limited JavaScript subset. Check
`Technical Description.md` and `docs/RESTRICTIONS.md`. In particular, complex
function arguments may require an intermediate variable.

## 10. Main Release Files

- `main.py`: command-line compiler entry point.
- `translator.py`: JavaScript AST to Z80 translation.
- `utils.py`: compiler helpers and diagnostics.
- `config.py`: compiler configuration and shared state.
- `*.asc`: Z80 support libraries.
- `input.js`: default source file.
- `run_jassco.cmd` and `jassco.bat`: Windows launchers.
- `requirements.txt`: Python dependency list.
- `release notes.txt`: changes relevant to that release.

The generated `output.asm`, examples, golden references and test outputs are not
included in each release ZIP.

Pasmo and an emulator are external tools and are not included in the release
ZIP.

## 11. Scope And Restrictions

JASSCO is not a browser JavaScript runtime. It compiles a practical subset aimed
at small Z80 programs, currently focused on ZX Spectrum.

Read `Technical Description.md` for supported syntax and
`docs/RESTRICTIONS.md` for known limitations before adapting a large program.
