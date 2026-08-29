// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSigWallet {
    address[] public owners;
    uint256 public required;

    struct Transaction {
        address to;
        uint256 value;
        bool executed;
    }

    Transaction[] public transactions;

    mapping(uint256 => mapping(address => bool)) public approved;

    constructor(address _owner1, address _owner2) {
        require(_owner1 != address(0), "Invalid owner 1");
        require(_owner2 != address(0), "Invalid owner 2");
        require(_owner1 != _owner2, "Owners must be different");

        owners.push(_owner1);
        owners.push(_owner2);

        required = 2;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owners[0] || msg.sender == owners[1],
            "Not an owner"
        );
        _;
    }

    receive() external payable {}

    function submitTransaction(
        address _to,
        uint256 _value
    ) public onlyOwner {
        require(_to != address(0), "Invalid recipient");

        transactions.push(
            Transaction({
                to: _to,
                value: _value,
                executed: false
            })
        );
    }

    function approveTransaction(
        uint256 _txIndex
    ) public onlyOwner {
        require(
            _txIndex < transactions.length,
            "Invalid transaction"
        );

        require(
            !transactions[_txIndex].executed,
            "Already executed"
        );

        require(
            !approved[_txIndex][msg.sender],
            "Already approved"
        );

        approved[_txIndex][msg.sender] = true;
    }

    function executeTransaction(
        uint256 _txIndex
    ) public onlyOwner {
        require(
            _txIndex < transactions.length,
            "Invalid transaction"
        );

        Transaction storage txn = transactions[_txIndex];

        require(!txn.executed, "Already executed");

        uint256 approvalCount = 0;

        for (uint256 i = 0; i < owners.length; i++) {
            if (approved[_txIndex][owners[i]]) {
                approvalCount++;
            }
        }

        require(
            approvalCount >= required,
            "Not enough approvals"
        );

        require(
            address(this).balance >= txn.value,
            "Insufficient wallet balance"
        );

        txn.executed = true;

        (bool success, ) = payable(txn.to).call{
            value: txn.value
        }("");

        require(success, "Transfer failed");
    }

    function getOwners()
        public
        view
        returns (address[] memory)
    {
        return owners;
    }

    function getTransactionCount()
        public
        view
        returns (uint256)
    {
        return transactions.length;
    }

    function getTransaction(
        uint256 _txIndex
    )
        public
        view
        returns (
            address to,
            uint256 value,
            bool executed
        )
    {
        require(
            _txIndex < transactions.length,
            "Invalid transaction"
        );

        Transaction memory txn = transactions[_txIndex];

        return (
            txn.to,
            txn.value,
            txn.executed
        );
    }
}