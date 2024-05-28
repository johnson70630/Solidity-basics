// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

error TransferNotOwner();
error TransferNotOwner2(address sender);

contract ErrorTest{

    mapping(uint256 => address) private _owners;

    function transferOwner1(uint256 tokenID, address newOwner) public{
        if (_owners[tokenID] != msg.sender){
            revert TransferNotOwner();
        }
        _owners[tokenID] = newOwner;
    }

    function transferOwner2(uint256 tokenID, address newOwner) public{
        require(_owners[tokenID] == msg.sender, "Transfer Not Owner");
         _owners[tokenID] = newOwner;
    }

    function transferOwner3(uint256 tokenId, address newOwner) public {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }
}