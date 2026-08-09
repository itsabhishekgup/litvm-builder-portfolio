// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {

    mapping(address => uint256) public balances;
    bool private locked;

    modifier nonReentrant() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }

    // Deposit ETH into contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Check your balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Withdraw ETH
    function withdraw(uint256 amount) public nonReentrant {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "ETH transfer failed");
    }
}