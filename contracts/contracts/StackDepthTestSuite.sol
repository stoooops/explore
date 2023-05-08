// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract StackDepthTestSuite {
  function stackNotTooDeep(
    uint b1,
    uint b2,
    uint b3,
    uint b4,
    uint b5,
    uint b6,
    uint b7,
    uint b8,
    uint b9,
    uint b10,
    uint b11 /* stack too deep */,
    uint b12 /* , uint b13 */
  ) public pure returns (uint) {
    uint a1;
    uint a2;
    uint a3;
    uint a4;
    uint a5;
    uint a6;
    uint a7;
    uint a8;
    uint a9;
    uint a10;
    uint a11;
    uint a12;
    uint a13;
    uint a14;
    uint a15;
    // stack too deep
    // uint a16 = 0;
    return a15;
  }
}
