# Escrow Smart Contract

A simple Ethereum-compatible escrow contract built and tested on the LitVM LiteForge Testnet.

## Overview

The contract allows a buyer to deposit ETH into the escrow. The deposited funds remain locked until the buyer releases the payment to the seller.

## Features

- Buyer and seller roles
- ETH deposit
- Locked escrow funds
- Buyer-controlled release
- Seller receives released funds
- On-chain state tracking

## Contract Functions

- deposit() — Buyer deposits ETH into the escrow.
- release() — Buyer releases the deposited funds to the seller.
- buyer() — Returns the buyer address.
- seller() — Returns the seller address.
- amount() — Returns the deposited amount in wei.
- deposited() — Shows whether a deposit has been made.
- released() — Shows whether the payment has been released.

## Test Flow

1. Deploy contract with seller address.
2. Deposit 0.003 ETH.
3. Verify deposited() returns true.
4. Verify the deposited amount.
5. Call release() from the buyer wallet.
6. Verify released() returns true.
7. Confirm the seller received the payment.

## Network

LitVM LiteForge Testnet

## Status

✅ Contract deployed  
✅ Deposit tested  
✅ Release tested successfully