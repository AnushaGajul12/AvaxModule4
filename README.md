# Points Token Contract

This is the README file for the Points Token contract, a Solidity smart contract that implements an ERC-20 token with additional functionality for managing points and redeeming prizes.

## Table of Contents

- [Introduction](#introduction)
- [Contract Details](#contract-details)
- [Usage](#usage)
  - [Prizes](#prizes)
  - [Minting Tokens](#minting-tokens)
  - [Transferring Tokens](#transferring-tokens)
  - [Burning Tokens](#burning-tokens)
- [License](#license)

## Introduction

The Points Token contract is a Solidity smart contract that extends the functionality of an ERC-20 token. It allows users to earn points and redeem prizes using their points. The contract is built on the OpenZeppelin library, making use of ERC-20 standard features for tokens.

## Contract Details

The contract includes the following key features:

- Inherits from OpenZeppelin's `ERC20` and `Ownable` contracts.
- Defines a custom struct `Prize` to represent prizes that users can redeem.
- Maintains a dynamic array `prizes` to store the available prizes.
- Constructor function initializes the contract, creating an ERC-20 token named "Degen" (DGN) and adding two default prizes ("PrizeA" and "PrizeB") to the `prizes` array.
- Allows users to redeem prizes by providing the required number of tokens.
- Supports minting of new tokens by the contract owner.
- Provides functions for transferring tokens between users.
- Allows users to burn their tokens.

## Usage

### Prizes

The contract defines a `Prize` struct with two attributes: `prizeName` and `cost`. Users can redeem prizes by calling the `redeemTokens(uint256 _value, uint256 prizeIndex)` function. The following steps outline the process:

1. Check the balance of tokens owned by the user.
2. Ensure the provided `_value` is greater than or equal to the cost of the selected prize.
3. Transfer the required tokens to the contract.
4. Emit the `PrizeRedeemed` event with the user's address and the name of the redeemed prize.

### Minting Tokens

The contract owner can mint new tokens using the `mint(address to, uint256 amount)` function. This allows the owner to increase the total supply of tokens.

### Transferring Tokens

Users can transfer their tokens to another address by calling the `transferTokens(address _rec, uint256 _value)` function. This function checks the sender's balance and transfers the specified amount to the recipient.

### Burning Tokens

Users can burn their own tokens by calling the `burnTokens(uint256 _value)` function. This function reduces the user's token balance by the specified amount.

## License

This contract is licensed under the MIT License. You can find the license text in the contract source code (SPDX-License-Identifier: MIT). Feel free to use, modify, and distribute this code in accordance with the terms of the license.
