// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    address public owner;

    uint256 public fundingGoal;
    uint256 public deadline;
    uint256 public totalRaised;

    mapping(address => uint256) public contributions;

    constructor(uint256 _fundingGoal, uint256 _durationInMinutes) {
        owner = msg.sender;
        fundingGoal = _fundingGoal;
        deadline = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Campaign ended");
        require(msg.value > 0, "Contribution must be greater than zero");

        contributions[msg.sender] += msg.value;
        totalRaised += msg.value;
    }

    function withdrawFunds() public {
        require(msg.sender == owner, "Only owner");
        require(block.timestamp >= deadline, "Campaign still active");
        require(totalRaised >= fundingGoal, "Funding goal not reached");

        uint256 amount = address(this).balance;

        (bool success, ) = payable(owner).call{value: amount}("");
        require(success, "Transfer failed");
    }

    function refund() public {
        require(block.timestamp >= deadline, "Campaign still active");
        require(totalRaised < fundingGoal, "Funding goal reached");

        uint256 amount = contributions[msg.sender];
        require(amount > 0, "No contribution found");

        contributions[msg.sender] = 0;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Refund failed");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getContribution(
        address contributor
    ) public view returns (uint256) {
        return contributions[contributor];
    }
}
