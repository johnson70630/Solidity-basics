// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract DefultValue{
    bool public _bool; // false
    string public _string; // ""
    int public _int; // 0
    uint public _uint; // 0
    address public _address; // 0x0000000000000000000000000000000000000000

    enum ActionSet { Buy, Hold, Sell}
    ActionSet public _enum; // first element (Buy: 0)

    function fi() internal{} // internal blank function 
    function fe() external{} // external blank function 

    // Reference Types 
    uint[3] public _staticArray; // [0, 0, 0]
    uint[] public _dynamicArrayl; // '[]'
    mapping(uint => address) public _mapping; // uint => address

    struct Student{
        uint256 id;
        uint256 score;
    }
    Student public student; // 0, 0

    // delete will make variables returning to default value
    bool public _bool2 = true;
    function d() external{
        delete _bool2; // false
    }
}
