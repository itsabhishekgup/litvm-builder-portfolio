# Crowdfunding Smart Contract

A simple crowdfunding smart contract built and tested on the LitVM LiteForge Testnet.

## Overview

This contract allows users to contribute native value toward a predefined funding goal before a deadline.

If the funding goal is reached, the campaign owner can withdraw the raised funds.

If the funding goal is not reached before the deadline, contributors can claim their contributions back through the refund mechanism.

## Features

- Campaign owner tracking
- Configurable funding goal
- Configurable campaign deadline
- Native value contributions
- Individual contributor balance tracking
- Total funds raised tracking
- Successful campaign withdrawal
- Failed campaign refunds
- Contract balance checking

## Main Functions

### contribute()

Allows users to contribute native value before the campaign deadline.

### withdrawFunds()

Allows the campaign owner to withdraw the contract balance after the deadline when the funding goal has been reached.

### refund()

Allows contributors to reclaim their contribution after the deadline if the funding goal was not reached.

### getBalance()

Returns the current contract balance.

### getContribution(address)

Returns the contribution amount of a specific address.

## Test Flow

### Successful Campaign

1. Deploy contract with a funding goal.
2. Contributor makes a contribution.
3. Additional contribution is made.
4. Funding goal is reached.
5. Campaign deadline passes.
6. Owner successfully withdraws the funds.

### Failed Campaign

1. Deploy a new campaign with a higher funding goal.
2. Make a contribution below the target.
3. Wait for the deadline.
4. Contributor calls refund().
5. Contribution is successfully returned.

## Network

- Network: LitVM LiteForge Testnet
- Chain ID: 4441
- Native Gas Token: zkLTC
- Contract: Crowdfunding
- Status: Successfully deployed and tested

## Learning Concepts

This project demonstrates:

- msg.value
- msg.sender
- Payable functions
- Mappings
- Time-based conditions
- Contract balances
- State management
- Conditional withdrawals
- Refund mechanisms
- Low-level value transfers using .call{value: ...}("")
- Access control

## Disclaimer

This is an educational/testnet smart contract and has not been audited for production use.