// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "library3.sol";

library L1 {
    function f_internal(uint a, uint b) internal pure returns(uint) {
        return L3.f(a, b);
    }
    function f_public(uint a, uint b) public pure returns(uint) {
        return L3.f(a, b);
    }
}
