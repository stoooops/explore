// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
Mappings are an essential data structure in Solidity, allowing for efficient and
flexible storage of key-value pairs. In this guide, we will cover the basics of
mappings and how to use them in your smart contracts.
*/

contract SimpleMappingExample {
  // Declare a mapping to store uint256 values with address keys
  mapping(address => uint256) public balances;

  // Set a value for a specific key
  function setBalance(uint256 newBalance) public {
    balances[msg.sender] = newBalance;
  }

  // Retrieve the value for a specific key
  function getBalance(address user) public view returns (uint256) {
    return balances[user];
  }
}

contract NestedMappingExample {
  // Declare a nested mapping to store uint256 values with two address keys
  mapping(address => mapping(address => uint256)) public allowances;

  // Set a value for a specific pair of keys
  function setAllowance(address spender, uint256 amount) public {
    allowances[msg.sender][spender] = amount;
  }

  // Retrieve the value for a specific pair of keys
  function getAllowance(address owner, address spender) public view returns (uint256) {
    return allowances[owner][spender];
  }
}

/*
This guide introduces mappings as a fundamental data structure in Solidity for
storing key-value pairs efficiently. We covered the basics of declaring, setting,
and retrieving values in mappings, as well as using nested mappings for more complex
data relationships.
*/
