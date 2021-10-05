// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "library-for-library.sol";

library L2 {
    function g(uint a, uint b) public pure returns(uint) {
        return LL.h(a, b);
    }
}
