// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
In this guide, we will cover contract upgradability in Solidity. We will discuss the
limitations of the EVM and how to use the proxy pattern to create upgradable contracts.
*/

// The base contract to be called using delegatecall
contract BaseContract {
  uint256 public data;

  function setData(uint256 _data) public {
    data = _data;
  }
}

// The upgradable proxy contract
contract UpgradableProxy {
  address public implementation;

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
The proxy pattern is a popular technique for creating upgradable contracts. It uses
a proxy contract to maintain the storage while executing the logic from the
implementation contract. To upgrade the contract, simply update the address of the
implementation contract in the proxy.
*/
