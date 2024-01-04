// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

interface IConsumerContract {
    function requestInfo(
        address _oracle,
        string memory _jobId,
        string memory chid
    ) external;

    function lastRetrievedsubscriberCount()
        external
        view
        returns (string memory);
}

contract VIDAO is ERC721, ERC721URIStorage {
    IConsumerContract private consumerContract;
    mapping(uint256 => string) private tokenSubscriberCounts;

    constructor(address _consumerContractAddress) ERC721("VIDAO", "VID") {
        consumerContract = IConsumerContract(_consumerContractAddress);
    }

    function fetchSubscriberCount(
        address _oracle,
        string memory _jobId,
        string memory chid
    ) public {
        consumerContract.requestInfo(_oracle, _jobId, chid);
    }

    function safeMint(address to, uint256 tokenId) public {
        // Directly retrieve the subscriber count from the consumer contract
        string memory subscriberCount = consumerContract
            .lastRetrievedsubscriberCount();

        // Ensure the subscriberCount has been retrieved before minting
        require(bytes(subscriberCount).length > 0, "Subscriber count not set.");

        // Construct token URI with the fetched subscriber count and mint the token
        string memory uri = constructTokenURI(subscriberCount);
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);

        // Store the subscriber count for the token
        tokenSubscriberCounts[tokenId] = subscriberCount;
    }

    function constructTokenURI(
        string memory subscriberCount
    ) private pure returns (string memory) {
        // Modified constructTokenURI function to include new metadata
        return
            string(
                abi.encodePacked(
                    "{",
                    '"description": "Minting subscribercount on NFTs", ',
                    '"external_url": "https://alchemy.com", ',
                    '"image": "https://storage.googleapis.com/opensea-prod.appspot.com/puffs/3.png", ',
                    '"name": "JaniB", ',
                    '"attributes": [',
                    '{ "trait_type": "SubscriberCount", "value": "',
                    subscriberCount,
                    '" }',
                    "]",
                    "}"
                )
            );
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
