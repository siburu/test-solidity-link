// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "L.sol";
import "L2.sol";

contract C {
    uint public x;
    uint public y;

    function f(uint a, uint b) public {
        x = L.f(a, b);
        y = L2.g(a, b);
    }
}
