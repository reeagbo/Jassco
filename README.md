# JASSCO (JAvaSCript to ASSembly COmpiler)

Jassco is a project, written in python, that enables Z80 machines to run JavaScript code. Jassco is a cross-compiler that reads a file containing JavaScript and produces code that reproduces its behavior in a Z80 environment. At the moment, I´m focused on ZX Spectrum, but the way I´m building it, with separate libraries for specific tasks, should allow ports to other Z80 machines without much effort. Anyway that's still far beyond the horizon.

Note: all technical details and restrictions can be read in detail in the **Technical Description**.

## Capabilities
Let me summarize what it's currently capable of:
- JavaScript ES2 taken as reference.
- Very simple types: 16-bit integers, boolens and strings.
- Data structures:
  - Variables and constants.
- all basic code flows supported:
  - structures: if-then-else, for-break, while-do, do-while, switch-case).
  - assignments.
  - binary expressions.
  - functions: declaration and call, passing parameters and recursion (only numbers tested).
  - methods: generally, not supported, but some specific cases are.

