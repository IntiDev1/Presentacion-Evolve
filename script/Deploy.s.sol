// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "../lib/forge-std/src/Script.sol";
import {DemoToken} from "../src/DemoToken.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new DemoToken(1000 ether);
        vm.stopBroadcast();
    }
}
