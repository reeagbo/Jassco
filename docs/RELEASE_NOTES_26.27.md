Release notes

26.27 (30/06/26)
----------------
Features
- Arrays: unified 1D numeric and string arrays under a 16-bit length header,
  allowing arrays larger than 255 entries.
- Functions: regular calls now preserve parameter slots and infer simple
  literal parameter types, including string parameters.
- Assembly output: generated ASM is formatted in stable columns, with labels
  emitted without trailing colons.
