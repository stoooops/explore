// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
In this guide, we will cover the basics of libraries in Solidity, the "using for" statement,
and how to use delegatecall with library functions.

Libraries are useful for organizing and reusing code, and they can help reduce gas costs by
deploying the library once and linking it to multiple contracts.
*/

// Defining a library
library SafeMath {
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a, 'Addition overflow');
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a, 'Subtraction overflow');
    return a - b;
  }
}

// Using the "using for" statement to attach library functions to a type
contract MyContract {
  using SafeMath for uint256;

  function addNumbers(uint256 a, uint256 b) public pure returns (uint256) {
    // Using the add function from the SafeMath library
    return a.add(b);
  }

  function subNumbers(uint256 a, uint256 b) public pure returns (uint256) {
    // Using the sub function from the SafeMath library
    return a.sub(b);
  }
}

/*
In this guide, we covered the basics of libraries, the "using for" statement.
Libraries are an efficient way to organize and reuse code, and they can help reduce
gas costs by deploying the library once and linking it to multiple contracts.
The "using for" statement allows for easy integration of library functions.
*/
