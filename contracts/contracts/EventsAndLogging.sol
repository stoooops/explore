// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
Events are a crucial aspect of Ethereum smart contracts, allowing for efficient and
accessible logging of important information. In this guide, we will cover the importance
of events, how to define and emit events, and how to filter events for specific information.

Events provide a way to log activity on the blockchain, making it easy to monitor contract
activity and react to specific changes in the contract's state.
*/

// Defining an event
contract SimpleStorage {
  uint256 public storedData;

  // Define the event
  event DataStored(uint256 indexed _data, address indexed _setter);

  // Set the data and emit the event
  function set(uint256 x) public {
    storedData = x;
    emit DataStored(x, msg.sender); // Emit the event with arguments
  }
}

// Using events in a more complex example
contract Auction {
  address public highestBidder;
  uint256 public highestBid;

  // Define the events
  event NewHighestBid(address indexed _bidder, uint256 indexed _amount);
  event AuctionEnded(address _winner, uint256 _amount);

  bool public ended;

  // Constructor
  constructor() {
    highestBidder = msg.sender;
    highestBid = 0;
    ended = false;
  }

  // Bid function
  function bid() public payable {
    require(!ended, 'Auction has ended');
    require(msg.value > highestBid, 'Bid must be higher than the current highest bid');

    highestBidder = msg.sender;
    highestBid = msg.value;

    emit NewHighestBid(msg.sender, msg.value); // Emit the event with arguments
  }

  // End the auction
  function endAuction() public {
    require(!ended, 'Auction has already ended');
    require(msg.sender == highestBidder, 'Only the highest bidder can end the auction');

    ended = true;
    emit AuctionEnded(highestBidder, highestBid); // Emit the event with arguments
  }
}

/*
This guide demonstrates the importance of events and logging in Solidity contracts. We
covered how to define and emit events using the `event` keyword and the `emit` statement.
Additionally, we showcased how to use events in both simple and more complex contract examples.

Events play a vital role in monitoring contract activity and reacting to specific changes
in the contract's state, providing essential information to users and developers.
*/
