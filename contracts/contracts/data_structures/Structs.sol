// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
Structs are a powerful data structure in Solidity, allowing for the organization
of related data into a single entity. In this guide, we will cover the basics of
structs and how to use them in your smart contracts.
*/

contract SimpleStructExample {
  // Define a struct to represent a user
  struct User {
    string name;
    uint256 age;
  }

  // Declare a mapping to store User structs with address keys
  mapping(address => User) public users;

  // Set a User struct for a specific key
  function setUser(string memory name, uint256 age) public {
    users[msg.sender] = User({name: name, age: age});
  }

  // Retrieve a User struct for a specific key
  function getUser(address userAddress) public view returns (User memory) {
    return users[userAddress];
  }
}

/*
This guide introduces structs as a powerful data structure in Solidity for organizing
related data into a single entity. We covered the basics of declaring, defining, and
using structs in a simple example contract.
*/
