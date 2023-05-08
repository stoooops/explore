// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
File: HandlingEther.sol

In this guide, we will cover how to handle Ether in Solidity, including payable functions,
fallback functions, and receive functions.
*/

// A simple contract to demonstrate handling Ether
contract EtherHandling {
  // Declare an event to log received Ether
  event ReceivedEther(address indexed sender, uint256 amount);

  // A payable function to allow the contract to receive Ether
  function deposit() public payable {
    emit ReceivedEther(msg.sender, msg.value);
  }

  // A function to withdraw Ether from the contract
  function withdraw(uint256 amount) public {
    require(address(this).balance >= amount, 'Insufficient balance');
    payable(msg.sender).transfer(amount);
  }

  // Return the balance of the contract
  function getBalance() public view returns (uint256) {
    return address(this).balance;
  }

  // Fallback function to accept incoming Ether transfers
  fallback() external payable {
    emit ReceivedEther(msg.sender, msg.value);
  }

  // Receive function to accept incoming Ether transfers
  receive() external payable {
    emit ReceivedEther(msg.sender, msg.value);
  }
}

/*
In this guide, we covered how to handle Ether in Solidity, including payable functions,
fallback functions, and receive functions. The payable modifier allows functions to receive
Ether, and fallback and receive functions provide a way for contracts to accept Ether transfers.
Emitting events can help log Ether transactions, making it easier to track and monitor them.
*/
