// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // stating version

contract StorageTest{

    // calldata: immutable, exist in memeory, not on chain
    function Calldata(uint[] calldata _x) public pure returns(uint[] calldata){
        // _x[0] = 0; <- immutable
        return(_x);
    }
    // storage: mutable, exist on chain
    uint[] x = [1, 2, 3];
    function Storage() public{
        uint[] storage testS = x;
        testS[0] = 100;
    }
    // memory: mutable, exist in memeory, not on chain
    // change value in memory will not affect x
    function Memory() public view{
        uint[] memory testM = x;
        testM[0] = 100;
        testM[1] = 200;
        uint[] memory testM2 = x;
        testM2[0] = 300;
    }

    // store data on chain (high gas fee)
    uint public a = 1;
    uint public b;
    string public c;
    // can change value in variables
    function assign() external{
        a = 5;
        b = 2;
        c = "0xBD";
    }
    // variables only store in function 
    function bar() external pure returns(uint){
        uint aa = 1;
        uint bb = 3;
        uint cc = aa+bb;
        return(cc);
    }
    // global variables
    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender, blockNum, data);
    }

    /* 
    blockhash(uint blockNumber): (bytes32) - Hash of the given block – only applicable for the 256 most recent blocks, excluding the current block.
    block.coinbase: (address payable) - Address of the miner of the current block.
    block.gaslimit: (uint) - Gas limit of the current block.
    block.number: (uint) - Number of the current block.
    block.timestamp: (uint) - Timestamp of the current block, in seconds since the Unix epoch.
    gasleft(): (uint256) - Remaining gas.
    msg.data: (bytes calldata) - Complete call data.
    msg.sender: (address payable) - Message sender (current caller).
    msg.sig: (bytes4) - First four bytes of the calldata (function identifier).
    msg.value: (uint) - Amount of wei sent with the current transaction.
    */
}