// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract DeleteContract{
    uint public value = 10;
    
    constructor() payable {}

    receive() external payable { }

    function deleteContract() external {
        selfdestruct(payable(msg.sender));
    }

    function gerBalance() external view returns(uint balance){
        balance = address(this).balance;
    }
}