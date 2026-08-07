// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    uint256 public votesA;
    uint256 public votesB;

    function voteA() public {
        votesA += 1;
    }

    function voteB() public {
        votesB += 1;
    }

    function getVotesA() public view returns (uint256) {
        return votesA;
    }

    function getVotesB() public view returns (uint256) {
        return votesB;
    }
}