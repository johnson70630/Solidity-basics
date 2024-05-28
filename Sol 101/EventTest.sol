// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract EventTest{
    // record coin amount of every address
    mapping(address => uint) public _balances;
    // define event
    event Transfer(address indexed from, address indexed to, uint256 value);

    // define transfer function
    function _transfer(
        address from,
        address to,
        uint256 amount
    )external{
        _balances[from] = 10000; 

        _balances[from] -= amount;
        _balances[to] += amount;
        // emit the event
        emit Transfer(from, to ,amount);
    }
}