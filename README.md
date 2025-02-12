# JASSco (JAva SCript to ASSembly Compiler)

Jassco is a project, written in python, that enables Z80 machines to run JavaScript code. Jassco is a cross-compiler that reads a file containing JavaScript and produces code that reproduces the behavior. At the moment, I´m focused on ZX Spectrum, but the way I´m building it, with separate libraries for specific tasks, should allow ports to other Z80 machines without much effort. Anyway that's still far beyond the horizon.

Let me summarize what it's currently capable of:
- JavaScript ES2 taken as reference.
- Very simple type: 16-bit integers and strings.
- Variables, Arrays, 2D matrices and dictionaries supported.
- Variables and constant declaration.
- all basic coding supported:
  - structures: if-then-else, for-break, while-do, do-while, switch-case).
  - assignments (=, +=, -=, *=, /=, %=, &=, |=, ^=, <<=, >>=)
  - binary expressions ("==", "!=", "<", ">", "<=", ">=", "+", "-", "*", "/", "%")
  - functions: declaration and call, passing parameters (only numbers tested).
  - methods: generally, not supported, but some specific cases are.
    - console.log to print messages.
    - math.random produces a 16 bit pseudo-random number.
    - some canvas methods (ctx.moveTo, ctx.lineTo) to be able to draw in the screen.
    
Limitations are huge at the moment. Actually, I´m at that stage that the number of doors I´m opening is bigger than the ones I´m closing. I will list the main ones here:
- limited recursion, due to lille testing.
- very limited string support, but getting better.
- no object methods supported, with the exceptions listed above.
