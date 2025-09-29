// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/DemoToken.sol";

contract DemoTokenTest is Test {
    DemoToken token;

    function setUp() public {
        token = new DemoToken(1000 ether); // 1000 tokens
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1000 ether);
    }

    function testTransfer() public {
        address alice = address(0x1);
        token.transfer(alice, 100 ether);
        assertEq(token.balanceOf(alice), 100 ether);
    }
}
