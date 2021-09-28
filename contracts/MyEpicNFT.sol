// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// Import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have acess
// to the inherited contract's method.
contract MyEpicNFT is ERC721URIStorage {
    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    
    // _tokenIds is a `state variable` which means if we change it,
    // the value is stored in the contract directly.
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and it's symbol.
    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("This is my NFT Contract. Woah!");
    }

    // A function our user will hit to get their NFT.
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the first NFTs data.
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/2BKT");

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
        
        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}