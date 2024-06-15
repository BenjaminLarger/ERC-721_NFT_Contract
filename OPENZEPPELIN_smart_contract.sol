// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OpenZeppelinNFT is ERC721, Ownable {

    uint256 public tokenSupply = 0;
    uint256 public constant MAX_SUPPLY = 5;
    uint256 public PRICE = 1 ether;

    address immutable deployer;

    constructor() ERC721("MyNFT", "MN") Ownable(msg.sender) {
        deployer = msg.sender;
        // Setting the initial owner to the deployer's address
    }

    function mint() external {
        require(tokenSupply < MAX_SUPPLY, "max supply reached");
        _mint(msg.sender, tokenSupply);
        tokenSupply++;
    }

    function viewBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() external onlyOwner {
        payable(deployer).transfer(address(this).balance);
    }

    function renounceOwnership() public override 
    {
        require(false, "cannot renonce");

    }

    function transferOwnership(address newOwner) public override
    {
        require(false, "cannot renonce");
    }
}

