// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/src/Test.sol";
import {BasicNft} from "src/BasicNFT.sol";
import {DeployBasicNft} from "script/DeployBasicNFT.s.sol";

contract BasicNFTTest is Test {
    DeployBasicNft public deployBasicNft;
    BasicNft public basicNft;
    address public USER = makeAddr("USER");

    string public constant tokenUri =
        "https://gateway.pinata.cloud/ipfs/QmTXPAUBoL1shmLA6zwqFdtro9t4iz9M6g6UByjhnaGx7w";

    function setUp() public {
        deployBasicNft = new DeployBasicNft();
        basicNft = deployBasicNft.run();
    }

    function testNameIsCorrect() public view {
        string memory name = basicNft.name();
        string memory expected = "ROBOT";
        assert(
            keccak256(abi.encodePacked(name)) ==
                keccak256(abi.encodePacked(expected))
        );
        //assertEq(basicNft.name(), "ROBOT"); This line can also work
    }

    function testCanMintNftAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNft(tokenUri);

        assertEq(basicNft.balanceOf(USER), 1);
        assert(
            keccak256(abi.encodePacked(basicNft.tokenURI(0))) ==
                keccak256(abi.encodePacked(tokenUri))
        );
    }
}
