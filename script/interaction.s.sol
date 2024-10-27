// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {DeployBasicNft} from "script/DeployBasicNFT.s.sol";
import {BasicNft} from "src/BasicNFT.sol";
import {Script} from "forge-std/src/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script {
    string public constant tokenUri =
        "https://gateway.pinata.cloud/ipfs/QmTXPAUBoL1shmLA6zwqFdtro9t4iz9M6g6UByjhnaGx7w";

    function run() external {
        address mostRecentDeployedBasicNft = DevOpsTools
            .get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentDeployedBasicNft);
    }

    function mintNftOnContract(address basicNftAddress) internal {
        vm.startBroadcast();
        BasicNft(basicNftAddress).mintNft(tokenUri);
        vm.stopBroadcast();
    }
}
