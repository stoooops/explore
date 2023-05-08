// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
File: GasOptimizationTechniques.sol

In this guide, we will cover various gas optimization techniques in Solidity to reduce
gas consumption and improve contract efficiency.
*/

/*
1. Use appropriate data types

Using appropriate data types like 'uint8', 'uint16', etc., can save gas as they consume
less storage compared to larger data types like 'uint256'.
*/
contract DataTypesExample {
  uint8 public smallValue;
  uint256 public largeValue;

  function setSmallValue(uint8 _value) public {
    smallValue = _value;
  }

  function setLargeValue(uint256 _value) public {
    largeValue = _value;
  }
}

/*
2. Use 'calldata' modifier for external function arguments

The 'calldata' modifier for external function arguments saves gas as it keeps the data in
the original call data payload and avoids additional memory allocation.
*/
contract CalldataExample {
  function processData(uint256[] calldata data) external pure returns (uint256) {
    uint256 sum = 0;
    for (uint256 i = 0; i < data.length; i++) {
      sum += data[i];
    }
    return sum;
  }
}

/*
3. Reduce contract storage usage

Minimizing contract storage usage can save a significant amount of gas. Reusing storage
slots, deleting unused variables, and optimizing struct packing can help reduce storage costs.
*/
contract StorageOptimizationExample {
  struct Data {
    uint128 data1;
    uint128 data2;
  }

  mapping(uint256 => Data) public dataMapping;

  function setData(uint256 key, uint128 _data1, uint128 _data2) public {
    dataMapping[key] = Data(_data1, _data2);
  }
}

/*
4. Use 'view' and 'pure' functions

Marking functions as 'view' or 'pure' can save gas, as these functions are not modifying
the state and can be executed off-chain without any transaction costs.
*/
contract ViewAndPureFunctionsExample {
  uint256 public value;

  function set(uint256 _value) public {
    value = _value;
  }

  function get() public view returns (uint256) {
    return value;
  }

  function calculate(uint256 x, uint256 y) public pure returns (uint256) {
    return x * y;
  }
}

/*
5. Optimize loops and avoid excessive computation

Optimizing loops and avoiding excessive computation can save gas. Minimizing loop iterations
and avoiding nested loops can help reduce gas costs.
*/
contract LoopOptimizationExample {
  uint256[] public values;

  function addValues(uint256[] calldata _values) public {
    // cache array length
    uint256 len = _values.length;
    for (uint256 i = 0; i < len; ) {
      values.push(_values[i]);

      // unchecked increment
      unchecked {
        ++i;
      }
    }
  }
}

/*
In this guide, we covered various gas optimization techniques in Solidity to reduce gas
consumption and improve contract efficiency. Using appropriate data types, 'calldata'
modifier, reducing contract storage usage, marking functions as 'view' or 'pure', and
optimizing loops can help save gas and make contracts more efficient.
*/
