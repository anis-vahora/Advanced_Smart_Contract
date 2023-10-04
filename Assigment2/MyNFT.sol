// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("MyNFT", "NFT") {
        tokenCounter = 0;
    }

    function mintNFT(
        string memory tokenURI
    ) public onlyOwner returns (uint256) {
        uint256 newNFTTokenId = tokenCounter;
        _mint(msg.sender, newNFTTokenId);
        _setTokenURI(newNFTTokenId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newNFTTokenId;
    }
}
