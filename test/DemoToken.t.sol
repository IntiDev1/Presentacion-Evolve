// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {DemoToken} from "../src/DemoToken.sol";

contract DemoTokenTest is Test {
    DemoToken token;
    address alice = address(0x1);

    function setUp() public {
        // Deploy DemoToken con 1 millón de tokens
        token = new DemoToken(1_000_000 ether);
    }

    function testInitialSupply() public {
        // El deployer (este contrato de test) debe tener todo el supply
        assertEq(token.totalSupply(), 1_000_000 ether);
        assertEq(token.balanceOf(address(this)), 1_000_000 ether);
    }

    function testTransfer() public {
        // Transferimos 100 tokens a Alice
        bool success = token.transfer(alice, 100 ether);
        assertTrue(success);
        assertEq(token.balanceOf(alice), 100 ether);
    }
}
