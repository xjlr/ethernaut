// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool);
}

contract TokenHelper {
    constructor() {
    }

    function transfer(address _to) public returns (bool) {
        uint32 ini = 20;
        for (uint32 i = 0; i < 20; ++i) {
            IToken(0xA76f30EB5490A039E4BFF321aD4c013160D8DB25).transfer(_to, ini);
            ini = ini * 2;
        }
        return true;
    }
}