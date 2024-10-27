# MoodNFT: Your On-Chain Mood Expressor

## Overview

This repository provides a Solidity smart contract and accompanying Forge script to deploy an NFT called MoodNFT. This NFT allows users to mint NFTs representing "mood" images in SVG format. The MoodNFT contract is deployed through the deployMoodNFT script, which converts SVG images into Base64 URIs suitable for on-chain storage.

## Installation

Clone the Repository:
Bash
git clone https://github.com/codebasebo/Foundry-DynamicNFT-ERC721.git
cd Foundry-DynamicNFT-ERC721
Use code with caution.

## Install Dependencies:
Bash
forge install
Use code with caution.

## Usage

Prepare SVG Images:
Create two SVG files named Happy.svg and Sad.svg in the ./img directory.
Deploy the Contract:
Bash
forge script script/deployMoodNFT.s.sol --rpc-url <your_rpc_url> --private-key <your_private_key>
Use code with caution.

Replace <your_rpc_url> with the URL of your preferred RPC provider and <your_private_key> with your private key.
How it Works

SVG to Base64 Conversion: The deployMoodNFT script reads the SVG files and converts them to Base64 URIs.
Contract Deployment: The script deploys the MoodNFT contract, embedding the Base64 URIs as part of the NFT metadata.
Minting NFTs: Users can mint NFTs, each representing a specific mood state (e.g., happy or sad).
License

## This project is licensed under the MIT License.

## Additional Considerations

##Security: 
Ensure the security of your smart contracts by following best practices and using well-tested libraries.
Gas Optimization: Optimize your contract for gas efficiency to reduce minting costs.
User Experience: Consider implementing a user-friendly interface to interact with your NFT.
Future Enhancements: Explore adding more mood states, customizable SVGs, or other features.
By following these steps and considering the additional tips, you can effectively deploy and utilize your MoodNFT contract.
