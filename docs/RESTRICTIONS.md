# Restrictions

## Current Restrictions

- Arrays need to be variables. Constants are not supported.
- Complex function-call arguments may be unsafe in some assembler-side cases. Use an intermediate variable when needed.

Example:

```js
// Not recommended
receive_bit(input_bits[input_bits_pointer])

// Supported pattern
send_bit = input_bits[input_bits_pointer]
receive_bit(send_bit)
```

- Function parameters are currently treated as integer-compatible values.
- Multiple sibling recursive calls preserve integer-compatible parameters.
  Function-local variables still use shared storage and are not yet reentrant.
- Repeated variable declarations are tolerated as compatibility warnings.
- Some 2D matrix literal behavior may be improvable, but changing it currently alters golden ASM output.

## Diagnostics

- Fatal unsupported cases are reported as compiler errors.
- Compatibility cases that current examples rely on are reported as warnings.
