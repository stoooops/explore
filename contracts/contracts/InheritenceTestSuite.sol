// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
C3 Linearization (C3 superclass linearization) is an algorithm for resolving method conflicts
that may arise in multiple inheritance scenarios in object-oriented programming languages.

In Solidity, it is used to determine the order of base contracts for initialization and
function calls resolution in case of multiple inheritance.

The algorithm works as follows:

1. Start with a list containing the contract itself (the most derived contract).
2. Traverse the inheritance graph in depth-first, left-to-right order.
3. For each contract encountered, add it to the list if it hasn't been added already and if
   all of its derived contracts are already in the list.
4. Continue the process until all base contracts have been added to the list.

C3 Linearization guarantees a unique and consistent order of base contracts, ensuring that
each contract is only initialized once and that function calls are resolved correctly.
If there is no valid order, the compiler will raise an error.
*/

// Define interfaces IFoo and IBar
interface IFoo {
  function foo() external;
}

interface IBar {
  function bar() external;
}

// Simple inheritance: Foo and Bar implement their respective interfaces
contract Foo is IFoo {
  function foo() external {}
}

contract Bar is IBar {
  function bar() external {}
}

// Multiple inheritance: IFooBar inherits from IFoo and IBar
interface IFooBar is IFoo, IBar {

}

// Multiple inheritance: FooBar inherits from Foo and Bar, and implements IFooBar
// C3 Linearization order: FooBar, Foo, Bar, IFooBar, IFoo, IBar
contract FooBar is Foo, Bar, IFooBar {

}

// Multiple inheritance with common base: A, B, and C inherit from A
contract A {
  function a() external {}
}

contract B is A {
  function b() external {}
}

contract C is A {
  function c() external {}
}

// Diamond inheritance pattern: D inherits from B and C, which both inherit from A
// C3 Linearization order: D, C, B, A
contract D is B, C {
  function d() external {}
}

// Including external contracts (e.g., OpenZeppelin's Ownable contract)
import {Ownable} from '@openzeppelin/contracts/access/Ownable.sol';

// Multiple inheritance with external contracts: FooOwnable and BarOwnable inherit from Foo, Bar, and Ownable
// C3 Linearization order for FooOwnable: FooOwnable, Foo, Ownable, IFoo
contract FooOwnable is Foo, Ownable {

}

// C3 Linearization order for BarOwnable: BarOwnable, Bar, Ownable, IBar
contract BarOwnable is Bar, Ownable {

}

// Complex multiple inheritance: FooBarOwnable inherits from FooOwnable, BarOwnable, and implements IFooBar
// C3 Linearization order: FooBarOwnable, FooOwnable, Foo, BarOwnable, Bar, Ownable, IFooBar, IFoo, IBar
contract FooBarOwnable is FooOwnable, BarOwnable, IFooBar {

}
