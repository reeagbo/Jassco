# JASSCO (JAvaSCript to ASSembly COmpiler)

Jassco is a project, written in python, that enables Z80 machines to run JavaScript code. Jassco is a cross-compiler that reads a file containing JavaScript and produces code that reproduces its behavior in a Z80 environment. At the moment, I´m focused on ZX Spectrum, but the way I´m building it, with separate libraries for specific tasks, should allow ports to other Z80 machines without much effort. Anyway that's still far beyond the horizon.

Let me summarize what it's currently capable of:
- JavaScript ES2 taken as reference.
- Very simple types: 16-bit integers, boolens and strings.
  - Integers: variables, Arrays, 2D matrices and dictionaries supported.
  - Strings: assignment, comparison and printing (very limited support).
  - Boolean: True and False is supported (actually replaced with 1 and 0 in the code).
- Data structures:
  - Variables and constants.
- all basic coding supported:
  - structures: if-then-else, for-break, while-do, do-while, switch-case).
  - assignments (=, +=, -=, *=, /=, %=, &=, |=, ^=, <<=, >>=)
  - binary expressions ("==", "!=", "<", ">", "<=", ">=", "+", "-", "*", "/", "%")
  - functions: declaration and call, passing parameters and recursion (only numbers tested).
  - methods: generally, not supported, but some specific cases are.
    - console.log to print messages.
    - math.random produces a 16 bit pseudo-random number.
    - some canvas methods (ctx.moveTo, ctx.lineTo) to be able to draw in the screen.
    
Limitations are huge at the moment. Actually, I´m at that stage that the number of doors I´m opening is bigger than the ones I´m closing. I will list the main ones here:
  - very limited string support, but getting better.
  - functions and variables need to be declared before being called. The reason for this is that JS does a first pass to identofy all these elements and create the properyl, before actually interpreting the code. At the moment, JASSCO is doing all in one pass.
  - all variables and object are global. no 'function' contexts implemented yet.
  - no object methods supported, with the exceptions listed above.
