.PHONY: compile
compile:
	solc --bin --overwrite -o build --base-path ./contracts ./contracts/C.sol

.PHONY: clean
clean:
	rm -rf ./build

.PHONY: link1
link1:
	solc --link --libraries L.sol:L=0x1111111111222222222233333333334444444444 build/C.bin

.PHONY: link2
link2:
	solc --link --libraries L2.sol:L2=0x9999999999888888888877777777776666666666 build/C.bin
