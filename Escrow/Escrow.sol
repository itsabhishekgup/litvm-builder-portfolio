// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public buyer;
    address public seller;

    uint256 public amount;
    bool public deposited;
    bool public released;

    constructor(address _seller) {
        buyer = msg.sender;
        seller = _seller;
    }

    function deposit() public payable {
        require(msg.sender == buyer, "Only buyer");
        require(!deposited, "Already deposited");
        require(msg.value > 0, "Amount must be greater than zero");

        amount = msg.value;
        deposited = true;
    }

    function release() public {
        require(msg.sender == buyer, "Only buyer");
        require(deposited, "No deposit");
        require(!released, "Already released");

        released = true;

        (bool success, ) = payable(seller).call{value: amount}("");
        require(success, "Transfer failed");
    }
}