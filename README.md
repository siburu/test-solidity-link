# Test for linking EVM bytecodes
Ref: https://docs.soliditylang.org/en/v0.8.7/using-the-compiler.html#library-linking

```
# Compile Solidity files into a build directory (build/C.bin is unlinked at this time)
$ make compile

# Link the address of the library L into build/C.bin in-place
$ make link1

# Link the address of the library L2 into build/C.bin in-place
$ make link2
```
