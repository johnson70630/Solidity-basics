// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // stating version

contract MappingTest{
    mapping(uint => address) public idToAddress; // mapping id to address
    mapping(address => address) public swapPair; // mapping coin pair

    struct Student{
        uint256 id;
        uint256 score;
    }
    // mapping(Student => uint) public testVar; <- wrong
    /* 
    1. Key can only be default type in solidity
    2. Mapping can only be storage
    3. If mapping is public, getter function will be created automatically 
    4. Add new pair -> _Var[_Key] = _Value
    */

    function writeMap(uint _Key, address _Value) public{
        idToAddress[_Key] = _Value;
    }
    /*
    Principles:
    1. Mappings do not store any information about the keys, nor do they have information about length.
    2. Mappings use keccak256(key) as the offset to access the value.
    3. The initial value of keys that have not been assigned a value is the default value for each type, such as 0 for uint.
    */ 
}