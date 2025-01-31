// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/src/Script.sol";
import {MoodNft} from "src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract deployMoodNFT is Script {
    function run() public returns (MoodNft) {
        string memory sadSvg = vm.readFile("./img/Sad.svg");
        string memory happySvg = vm.readFile("./img/Happy.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(happySvg),
            svgToImageURI(sadSvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        // example:
        // '<svg width="500" height="500" viewBox="0 0 285 350" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill="black" d="M150,0,L75,200,L225,200,Z"></path></svg>'
        // would return ""
        string memory baseURI = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg))) // Removing unnecessary type castings, this line can be resumed as follows : 'abi.encodePacked(svg)'
        );
        return string(abi.encodePacked(baseURI, svgBase64Encoded));
    }
}
