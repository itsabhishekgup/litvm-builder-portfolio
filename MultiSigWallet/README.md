# MultiSig Wallet

A simple 2-of-2 multisignature wallet smart contract built and tested on the LitVM LiteForge Testnet.

## Overview

The wallet requires approval from both owners before a transaction can be executed.

## Features

- 2 wallet owners
- 2-of-2 approval requirement
- ETH deposits
- Transaction submission
- Transaction approval
- Transaction execution
- On-chain transaction state tracking

## Test Flow

1. Deployed with two owners.
2. Funded the wallet with 0.001 ETH.
3. Submitted transaction #0.
4. Owner 1 approved transaction #0.
5. Owner 2 approved transaction #0.
6. Transaction #0 was executed successfully.
7. Funds were sent to the recipient.

## Network

LitVM LiteForge Testnet

## Status

✅ Deployed  
✅ Funded  
✅ Transaction submitted  
✅ Owner 1 approval  
✅ Owner 2 approval  
✅ Transaction executed