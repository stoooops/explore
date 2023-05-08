// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

/*
File: VotingSystemInSolidity.sol

In this guide, we will demonstrate how to implement a voting system in Solidity
by combining data structures such as mappings, structs, and arrays. This pattern
can be used as a basis for more complex voting systems or other applications that
require tracking and tallying votes.
*/

contract VotingSystem {
  // Define a struct to represent a candidate
  struct Candidate {
    string name;
    uint256 votes;
  }

  // Declare a mapping to store Candidate structs with uint256 keys
  mapping(uint256 => Candidate) public candidates;

  // Declare an array to store the keys of the candidates mapping
  uint256[] public candidateIds;

  // Declare a mapping to track if an address has already voted
  mapping(address => bool) public hasVoted;

  // Add a candidate to the list
  function addCandidate(string memory name) public {
    uint256 newCandidateId = candidateIds.length;
    candidates[newCandidateId] = Candidate({name: name, votes: 0});
    candidateIds.push(newCandidateId);
  }

  // Vote for a candidate
  function vote(uint256 candidateId) public {
    require(!hasVoted[msg.sender], 'You have already voted');
    require(candidateId < candidateIds.length, 'Invalid candidate ID');

    candidates[candidateId].votes++;
    hasVoted[msg.sender] = true;
  }

  // Retrieve the total number of candidates
  function getCandidateCount() public view returns (uint256) {
    return candidateIds.length;
  }
}

/*
This guide demonstrates how to implement a voting system in Solidity by combining
data structures such as mappings, structs, and arrays. We use mappings to store
candidate information and track voter status, structs to represent candidates, and
arrays to maintain the order of candidates. This pattern can be used as a basis for
more complex voting systems or other applications that require tracking and tallying votes.
*/
