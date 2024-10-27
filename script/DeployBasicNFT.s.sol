// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/src/Script.sol";
import {BasicNft} from "src/BasicNFT.sol";

contract DeployBasicNft is Script {
    uint256 public deployerKey;

    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }
}
