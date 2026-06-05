# Possible Improvements

These items are intentionally not applied as cleanup fixes because they may change generated assembly, supported semantics, or compatibility with current examples.

## Compiler Semantics

- Revisit 2D matrix literal declarations. A cleanup attempt made matrix literals such as `[[1,2,3],[4,5,6]]` generate explicit declarations and assignment code, changing golden ASM. This may be correct or useful, but needs semantic review on ZX Spectrum output before adopting.
- Define expected behavior for repeated `var` declarations. Current `testplan.js` relies on redeclarations being tolerated as warnings, so they are not fatal compiler errors yet.
- Decide whether boolean types should be first-class or always compiled as integer-compatible values. Cleanup currently treats booleans as integer-compatible where needed.
- Review function return handling and recursion. Return-address restoration is duplicated in `FunctionDeclaration` and `ReturnStatement`, and should be verified carefully before refactoring.
- Recursion with more than one recursive call at the same level needs a real parameter/local frame. The current generated code saves return addresses in `sta_ck2`, but function parameters such as `n_` are global variables and are overwritten by the first recursive call before the second sibling call evaluates its arguments.
- Review parameter typing. Function parameters are currently assumed to be integers.
- Review complex expressions as function-call arguments. Release notes mention this as a known restriction.
- Refine complex function-call argument detection. Current working examples produce warnings for some complex arguments, so this restriction cannot be made fatal globally without distinguishing safe cases from assembler-breaking cases.
- Review arrays, matrices, and dictionaries with calculated indexes, nested access, and non-literal initialization.
- Review switch `default` semantics. Cleanup prevents crashes for default cases, but runtime fall-through behavior should be checked against intended JavaScript-like behavior.
- Review `Memory.move` vs `memory.copy`. `testplan.js` uses `Memory.move(...)`, while the current translator has a `copy` branch that emits `mem_mov`; enabling/reporting this changes current golden behavior.

## Diagnostics

- Split diagnostics into warnings and errors instead of using `print()` for tolerated compatibility warnings and `report_error()` for fatal errors.
- Add negative tests after cleanup stabilizes: missing include, unsupported method, invalid function arguments, non-literal dictionary keys, unsupported switch discriminants, break/continue outside loops, and empty arrays.
- Make compiler errors include source context where practical: filename, line, original JS snippet, and AST node type.

## Project Structure

- Move source files into a stable `src/` or `jassco/` package layout.
- Move generated outputs such as `output.asm` out of source directories.
- Decide whether golden ASM should be committed directly or regenerated from a tagged baseline.
- Add a standard test command, for example `python tests/run_golden_tests.py`.
- Consider a virtual environment or clearer installation instructions around `requirements.txt`.

## Code Structure

- Replace broad `from utils import *` in `translator.py` with explicit imports.
- Break `translator.py` into smaller handlers by AST node group: expressions, statements, declarations, calls, structures, and literals.
- Introduce small helper functions for common stack code sequences.
- Centralize known built-in object/method dispatch tables for `console`, `memory`, `Math`, `document`, `canvas`, strings, arrays, and timers.
- Reduce global mutable state by passing a compiler context object through translation.
