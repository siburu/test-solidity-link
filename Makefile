.PHONY: compile
compile:
	solc --bin --overwrite -o build --base-path ./contracts ./contracts/contract.sol

.PHONY: clean
clean:
	rm -rf ./build

.PHONY: link-lib3-to-lib2
link-lib3-to-lib2:
	solc --link --libraries library3.sol:L3=0x1010101010101010101010101010101010101010 build/L2.bin

.PHONY: link-lib2-to-contract
link-lib2-to-contract:
	solc --link --libraries library2.sol:L2=0xf0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0 build/C.bin

.PHONY: link-lib3-to-contract
link-lib3-to-contract:
	solc --link --libraries library3.sol:L3=0x1010101010101010101010101010101010101010 build/C.bin
