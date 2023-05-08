// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
Error handling is crucial in Solidity to ensure that smart contracts behave as expected
and provide useful feedback when something goes wrong. Solidity offers three main ways
to handle errors: require, revert, and assert.

In this guide, we'll cover how to use require, revert, and assert to handle errors in
Solidity contracts through examples.
*/

// Example 1: Using require for input validation
contract NumberRange {
  uint256 public min;
  uint256 public max;

  constructor(uint256 _min, uint256 _max) {
    require(_min < _max, 'Min must be less than max');
    min = _min;
    max = _max;
  }

  function setRange(uint256 _min, uint256 _max) public {
    require(_min < _max, 'Min must be less than max');
    min = _min;
    max = _max;
  }

  function isInRange(uint256 number) public view returns (bool) {
    return number >= min && number <= max;
  }
}

// Example 2: Using revert with error messages for more complex conditions
contract TwoPlayerGame {
  address public player1;
  address public player2;
  uint256 public betAmount;

  enum GameState {
    Uninitialized,
    WaitingForPlayer2,
    GameStarted
  }
  GameState public state;

  constructor() {
    state = GameState.Uninitialized;
  }

  function joinGame() public payable {
    if (state == GameState.Uninitialized) {
      require(msg.value > 0, 'Must bet a non-zero amount');
      player1 = msg.sender;
      betAmount = msg.value;
      state = GameState.WaitingForPlayer2;
    } else if (state == GameState.WaitingForPlayer2) {
      require(msg.sender != player1, 'Cannot play against yourself');
      require(msg.value == betAmount, "Bet amount must match player1's bet");
      player2 = msg.sender;
      state = GameState.GameStarted;
    } else {
      revert('Game already started');
    }
  }

  // Implement game logic here
}

// Example 3: Using assert to catch internal errors
contract Calculator {
  function divide(uint256 a, uint256 b) public pure returns (uint256) {
    uint256 result = a / b;
    assert(b == 0 || result * b == a);
    return result;
  }
}

/*
This guide demonstrates how to handle errors in Solidity using require, revert, and assert.
We covered input validation using require, complex condition handling with revert and custom
error messages, and internal error checking using assert.

Proper error handling is essential for developing secure and reliable smart contracts in Solidity.
*/
