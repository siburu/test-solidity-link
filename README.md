# Test for linking EVM bytecodes
Ref: https://docs.soliditylang.org/en/v0.8.7/using-the-compiler.html#library-linking

This repository defines contract `C` and libraries `L1`, `L2` and `L3`.

Both `L1` and `L2` have internal and public functions (`f_internal` and `f_public`).
All the functions internally depend on `L3` by calling `L3.f`.

`C` depends on `L1` by calling `L1.f_internal`.
Also, `C` depends on `L2` by calling `L2.f_public`.

For `C` to be deployed to a blockchain, the following steps are needed.
1. `L3` is deployed to the blockchain.
2. The address of `L3` is embedded into the bytecode of `L2`.
	- `L2` executes `DELEGATECALL` to `L3.f`.
3. `L2` is deployed to the blockchain.
4. The address of `L2` is embedded into the bytecode of `C`.
	- `C` executes `DELEGATECALL` to `L2.f_public`.
5. The address of `L3` is embedded into the bytecode of `C`.
	- `C` does not directly but indirectly depend on `L3` via `L1`.
		- `C` executes `JUMP` to `L1.f_internal`.
		- `L1` executes `DELEGATECALL` to `L3.f`.

```
# Compile Solidity files into a build directory (build/C.bin and build/L2 are unlinked at this time)
$ make compile

# Embed the address of the library L3 into build/L2.bin in-place
$ make link-lib3-to-lib2

# Embed the address of the library L2 into build/C.bin in-place
$ make link-lib2-to-contract

# Embed the address of the library L3 into build/C.bin in-place
$ make link-lib3-to-contract
```
