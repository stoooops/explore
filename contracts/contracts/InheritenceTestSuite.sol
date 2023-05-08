// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

interface IFoo {
  function foo() external;
}

interface IBar {
  function bar() external;
}

interface IFooBar is IFoo, IBar {}

contract Foo is IFoo {
  function foo() external {}
}

contract Bar is IBar {
  function bar() external {}
}

contract FooBar is Foo, Bar, IFooBar {}
