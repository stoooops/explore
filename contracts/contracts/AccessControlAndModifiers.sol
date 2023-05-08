// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
Access control is an essential aspect of smart contracts to ensure that only authorized
parties can perform specific actions. Function modifiers in Solidity provide an elegant
way to define and manage access control rules.

Function modifiers can be used to modify the behavior of functions, allowing you to
enforce certain conditions before the function is executed or to modify the function's
return values.

In this guide, we'll cover some common access control patterns and how to use function
modifiers to enforce them.
*/

// Basic function modifier: onlyOwner
contract Ownable {
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, 'Caller is not the owner');
    _;
  }
}

// Usage of onlyOwner modifier to restrict access to a function
contract MyContract is Ownable {
  uint256 public counter;

  function increment() public onlyOwner {
    counter++;
  }
}

// Reusable modifier for role-based access control
contract AccessControl {
  mapping(address => uint256) public roles;

  // Role constants
  uint256 public constant ROLE_ADMIN = 1;
  uint256 public constant ROLE_OPERATOR = 2;

  modifier hasRole(uint256 role) {
    require(roles[msg.sender] == role, 'Caller does not have the required role');
    _;
  }
}

// Usage of hasRole modifier to restrict access based on roles
contract MyRoleBasedContract is AccessControl {
  function performAdminAction() public hasRole(ROLE_ADMIN) {
    // Perform an admin-only action
  }

  function performOperatorAction() public hasRole(ROLE_OPERATOR) {
    // Perform an operator-only action
  }
}

// Custom function modifier example: rate limiter
contract RateLimited {
  uint256 public lastAction;
  uint256 public rateLimit = 1 minutes;

  modifier rateLimited() {
    require(block.timestamp >= lastAction + rateLimit, 'Action rate-limited');
    lastAction = block.timestamp;
    _;
  }
}

// Usage of rateLimited modifier to limit the rate at which a function can be called
contract MyRateLimitedContract is RateLimited {
  function performLimitedAction() public rateLimited {
    // Perform an action subject to rate-limiting
  }
}

// Additional example 1: conditional execution
contract ConditionalExecution {
  bool public isActive;

  modifier whenActive() {
    require(isActive, 'Contract is not active');
    _;
  }

  modifier whenNotActive() {
    require(!isActive, 'Contract is active');
    _;
  }
}

// Usage of whenActive and whenNotActive modifiers
contract MyConditionalContract is ConditionalExecution {
  function performActiveOnlyAction() public whenActive {
    // Perform an action that can only be done when the contract is active
  }

  function performInactiveOnlyAction() public whenNotActive {
    // Perform an action that can only be done when the contract is inactive
  }
}

// Additional example 2: state change validation
contract StateValidation {
  uint256 public minValue;
  uint256 public maxValue;

  modifier isValidStateChange(uint256 newValue) {
    require(newValue >= minValue && newValue <= maxValue, 'Invalid state change');
    _;
  }
}

// Usage of isValidStateChange modifier to validate state changes
contract MyStateValidationContract is StateValidation {
  uint256 public value;

  function setValue(uint256 newValue) public isValidStateChange(newValue) {
    value = newValue;
  }
}

// Additional example 3: automatic state update
contract AutomaticStateUpdate {
  uint256 public lastUpdated;

  modifier updateTimestamp() {
    lastUpdated = block.timestamp;
    _;
  }
}

// Usage of updateTimestamp modifier to automatically update the lastUpdated state
contract MyAutomaticStateUpdateContract is AutomaticStateUpdate {
  uint256 public value;

  function setValue(uint256 newValue) public updateTimestamp {
    value = newValue;
  }
}

/*
This guide demonstrated how to create and use function modifiers for access control
and other purposes. We covered a basic onlyOwner modifier, role-based access control
using a hasRole modifier, a custom rateLimited modifier, and three additional interesting
patterns: conditional execution, state change validation, and automatic state update.

Function modifiers provide an elegant and reusable way to enforce access control rules
and other conditions in your Solidity contracts.
*/
