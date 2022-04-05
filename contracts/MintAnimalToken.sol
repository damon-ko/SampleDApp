// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintAnimalToken is ERC721Enumerable {
    constructor() ERC721("damonAnimals", "DAS") {}

    // 앞의 uint256 : animalTokenId 를 의미
    // 뒤의 uint256 : animalTypes 를 의미
    mapping(uint256 => uint256) public animalTypes;

    function mintAnimalToken() public {
        // totalSupply : 지금까지 민팅된 NFT 양, 유일함
        uint256 animalTokenId = totalSupply() + 1;

        // 5개의 숫자중 Random으로 뽑기 위함
        uint256 animalType = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, animalTokenId))) % 5 + 1;
        animalTypes[animalTokenId] = animalType;

        // ERC721에서 제공
        _mint(msg.sender, animalTokenId);
    }
}