# JASSCO Tickets

This is the canonical backlog for work planned after release 26.24.

## Open Functional Tickets

### JAS-002 - Make complex function arguments reliable

**Priority:** P2
**Origin:** Technical Description, Restrictions

Expressions such as `receive_bit(input_bits[pointer])` currently produce a
warning and may be unsafe. The compiler should either preserve every argument
correctly or reject only the unsupported shapes with a precise error.

**Done when:** literals, identifiers, member access and nested expressions have
defined behavior, with regression tests for each supported form.

### JAS-003 - Introduce real function frames and parameter types

**Priority:** P2
**Origin:** Technical Description, Improvements

Parameters are currently assumed to be integers and stored in global labels.
This limits recursion, reentrancy and string parameters.

**Done when:** the calling convention defines parameter types, local storage,
return values and stack cleanup without relying on shared parameter variables.

### JAS-004 - Resolve `Memory.move` and `memory.copy`

**Priority:** P2
**Origin:** Restrictions, Improvements, `testplan.js`

The documented compiler method is `memory.copy(source, target, size)`, while
the test plan calls `Memory.move(...)`. Only `copy` currently dispatches to
`mem_mov`, so `move` can be silently ignored.

**Done when:** one canonical method is documented and tested, or `move` is an
explicit compatibility alias. Unknown memory methods must fail compilation.

### JAS-005 - Define and validate `read()` semantics

**Priority:** P2
**Origin:** Technical Description, 26.24 chess investigation

`read(destination)` is a statement that writes into a variable, not an
expression that returns a value. Integer and string destinations need a clear,
tested contract.

**Done when:** supported destination types work, expression use such as
`value = read(buffer)` is rejected clearly, and stack balance is tested.

### JAS-006 - Verify `switch` and `default` runtime semantics

**Priority:** P2
**Origin:** Improvements

Parser crashes were prevented, but fall-through, `break` and `default`
placement have not been checked systematically against the intended subset.

**Done when:** focused runtime tests cover matched cases, no match, default,
fall-through and break behavior.

## Language And Diagnostics

### JAS-007 - Add negative compiler tests

**Priority:** P3
**Origin:** Improvements

Add automated failures for missing includes, unsupported methods, malformed
function calls, invalid dictionary keys, unsupported switch expressions,
break/continue outside loops and empty arrays.

**Done when:** each case checks exit status and diagnostic text without
producing a usable ASM output.

### JAS-008 - Add source locations to diagnostics

**Priority:** P3
**Origin:** Improvements

Errors and warnings should include the source filename, line number, relevant
JavaScript text and AST node type where available.

### JAS-009 - Decide declaration semantics

**Priority:** P2
**Origin:** Technical Description, Restrictions

Define the supported differences between `var`, `let` and `const`, including
repeated declarations and declarations without initializers. Release 26.24
executes repeated initializers but still reports compatibility warnings.

### JAS-010 - Review calculated and nested structure access

**Priority:** P3
**Origin:** Improvements

Extend focused runtime coverage for arrays, matrices and dictionaries using
calculated indexes, nested member access and non-literal initialization.

## Deferred Improvements

### JAS-011 - Expand string support

**Priority:** P2
**Origin:** Technical Description

Define and implement the next useful string operations beyond assignment,
comparison, `charAt()` and `charCodeAt()`.

### JAS-012 - Consider constant arrays

**Priority:** P2
**Origin:** Technical Description, Restrictions

Constant arrays are deliberately unsupported. Revisit only after immutable
storage and element-access semantics are specified.

### JAS-013 - Refactor compiler architecture

**Priority:** P2
**Origin:** Improvements

Split `translator.py` by AST area, replace wildcard imports, centralize built-in
dispatch, extract common stack sequences and reduce global mutable state.

### JAS-014 - Improve project and test layout

**Priority:** P2
**Origin:** Improvements

Consider a stable source package, a standard test command and clearer handling
of generated outputs and Python dependencies. Preserve the self-contained
release ZIP workflow.

## Deliberate Scope Limits

The following are documented limits, not active defects:

- No full browser JavaScript runtime.
- No floating-point numbers.
- No general-purpose object model beyond documented compiler patterns.
- Target remains small Z80 programs, currently focused on ZX Spectrum.
