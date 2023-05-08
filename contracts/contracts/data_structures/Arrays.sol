// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
Arrays are a fundamental data structure in Solidity, allowing for the organization
and storage of multiple elements of the same type. In this guide, we will cover the
basics of arrays, including fixed-size and dynamic arrays, and how to use them in
your smart contracts.
*/

contract SimpleArrayExample {
  // Declare a fixed-size array of uint256 values
  uint256[10] public fixedSizeArray;

  // Declare a dynamic array of uint256 values
  uint256[] public dynamicArray;

  // Add an element to the dynamic array
  function addToDynamicArray(uint256 value) public {
    dynamicArray.push(value);
  }

  // Remove the last element from the dynamic array
  function removeFromDynamicArray() public {
    require(dynamicArray.length > 0, 'Array is empty');
    dynamicArray.pop();
  }

  // Retrieve the length of the dynamic array
  function getDynamicArrayLength() public view returns (uint256) {
    return dynamicArray.length;
  }
}

/*
This guide introduces arrays as a fundamental data structure in Solidity for organizing
and storing multiple elements of the same type. We covered the basics of declaring,
using, and manipulating fixed-size and dynamic arrays in a simple example contract.
*/
