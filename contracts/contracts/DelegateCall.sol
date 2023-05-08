// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
In this guide, we will focus on understanding delegatecall in Solidity. Delegatecall
is a low-level function call used to execute code in the context of the calling contract,
preserving its storage while using the called contract's code.

Delegatecall is commonly used in proxy patterns, contract upgradability, and to interact
with libraries.
*/

// A simple contract to be called using delegatecall
contract CalledContract {
  function doSomething(uint256 a, uint256 b) public pure returns (uint256) {
    return a + b;
  }
}

// A simple contract to demonstrate delegatecall
contract CallingContract {
  uint256 public result;

  function callDoSomething(address _calledContract, uint256 a, uint256 b) public {
    (bool success, bytes memory data) = _calledContract.delegatecall(
      abi.encodeWithSignature('doSomething(uint256,uint256)', a, b)
    );
    require(success, 'Delegatecall failed');
    result = abi.decode(data, (uint256));
  }
}

// A more complex example: Upgradable storage contract using delegatecall
contract Storage {
  uint256 public data;

  function setData(uint256 _data) public {
    data = _data;
  }
}

contract StorageProxy {
  address public implementation;
  uint256 public data;

  constructor(address _implementation) {
    implementation = _implementation;
  }

  function upgradeTo(address _newImplementation) public {
    implementation = _newImplementation;
  }

  fallback() external payable {
    (bool success, ) = implementation.delegatecall(msg.data);
    require(success, 'Delegatecall failed');
  }

  receive() external payable {}
}

/*
In this guide, we focused on understanding delegatecall in Solidity. We demonstrated
its purpose and behavior through two examples: a simple contract calling another contract's
function using delegatecall, and a more complex upgradable storage contract using a
delegatecall-based proxy.

Delegatecall is a powerful feature in Solidity that allows contracts to execute code in
the context of the calling contract, preserving its storage while using the called contract's
code. This functionality enables various patterns, such as proxy contracts and upgradable
contracts.
*/
