# VIDAO NFT Contract

## Description
The VIDAO NFT contract is an Ethereum-based smart contract that leverages the ERC721 standard for non-fungible tokens (NFTs). This contract is designed to mint NFTs with a unique subscriber count as metadata, fetched from an external source via an adapter. It uses OpenZeppelin's ERC721 and ERC721URIStorage smart contracts for standardized NFT functionality and metadata handling.

## License
This project is licensed under the MIT License.

## Prerequisites
- Solidity ^0.8.20
- Node Package Manager (NPM)
- Deploy the consumercontract in: https://github.com/janiapro/EAforYT

## Installation
1. Clone the repository: git clone https://github.com/janiapro/VIDAO
2. Navigate to the project directory and install the dependencies
npm install

## Features
- **Minting NFTs with Subscriber Count**: Users can mint NFTs that have a unique subscriber count, which is fetched from an external source.
- **External Adapter Integration**: Integration with an external adapter to fetch the latest subscriber count.

## Functions

### `fetchSubscriberCount(address _oracle, string memory _jobId, string memory chid)`
Fetches the subscriber count from: https://github.com/janiapro/EAforYT/blob/main/Contracts/ClientContract.sol

### `safeMint(address to, uint256 tokenId)`
Mints a new token to the given address with the fetched subscriber count as metadata.

### `constructTokenURI(string memory subscriberCount)`
Constructs the token URI with the given subscriber count.

## Interfaces

### IConsumerContract
An interface for the consumer contract to request and retrieve subscriber count data:
https://github.com/janiapro/EAforYT/blob/main/Contracts/ClientContract.sol

## Getting Started
To mint your VIDAO NFTs with subscriber count metadata:
1. Ensure you have the required prerequisites installed.
2. Deploy the contract to your preferred Ethereum network.
3. Use the `fetchSubscriberCount` function to fetch the latest count.
4. Mint your NFT using the `safeMint` function.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your suggested changes.

## Questions or Issues
If you encounter any issues or have questions, please file an issue in the repository's issue tracker.

---

This README provides a basic overview of your VIDAO NFT contract functionalities and setup. Make sure to replace placeholders such as `[repository-link]` and `[project-directory]` with your specific details. Additionally, provide the actual deployed contract address in place of `[contract-address]` after deployment.
