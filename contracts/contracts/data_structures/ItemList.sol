// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
In this guide, we will demonstrate how to combine different data structures in Solidity
to implement a practical and useful pattern for managing a list of items with a mapping
for easy look-up and an array to maintain the order.
*/

contract ItemList {
  // Define a struct to represent an item
  struct Item {
    string name;
    uint256 price;
  }

  // Declare a mapping to store Item structs with uint256 keys
  mapping(uint256 => Item) public items;

  // Declare an array to store the keys of the items mapping
  uint256[] public itemIds;

  // Add an item to the list
  function addItem(string memory name, uint256 price) public {
    uint256 newItemId = itemIds.length;
    items[newItemId] = Item({name: name, price: price});
    itemIds.push(newItemId);
  }

  // Retrieve the total number of items in the list
  function getItemCount() public view returns (uint256) {
    return itemIds.length;
  }

  // Retrieve an item by its index in the array
  function getItemByIndex(uint256 index) public view returns (Item memory) {
    require(index < getItemCount(), 'Index out of bounds');
    uint256 itemId = itemIds[index];
    return items[itemId];
  }
}

/*
This guide demonstrates a practical and useful pattern combining data structures in
Solidity. By using a mapping for efficient look-up and an array to maintain the order,
we can manage a list of items with easy access and retrieval. This pattern can be
adapted for various use cases, such as managing tokens or tracking users and their
attributes.
*/
