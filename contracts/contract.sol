// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "library1.sol";
import "library2.sol";

contract C {
    uint public x;
    uint public y;

    function f(uint a, uint b) public {
        x = L1.f_internal(a, b);
        y = L2.f_public(a, b);
    }
}
