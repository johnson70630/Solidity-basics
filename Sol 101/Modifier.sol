// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Modifier{

    address owner; // define owner variable

    // construct function
    constructor(){
        owner = msg.sender; // set the owner to the address of the deployer
    }

    // define modifier
    modifier onlyOwner {
        require(msg.sender == owner); // check if the caller is the owner address
        _; // If so, continue executing the function body; otherwise, throw an error and revert the transaction.
    }

    // this will not work when modifier exist
    function changeOwner(address _newOwner) external onlyOwner{
        owner = _newOwner;
    }
}