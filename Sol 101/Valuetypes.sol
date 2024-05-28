// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // stating version

contract ValueTypes {
    // boolean
    bool public _bool = true;

    bool public _bool1 = !_bool; // not
    bool public _bool2 = _bool && _bool1; // and
    bool public _bool3 = _bool || _bool1; // or
    bool public _bool4 = _bool == _bool1; // equal
    bool public _bool5 = _bool != _bool1; // not equal

    // integer
    int public _int = -1; // all int
    uint public _uint = 1; // positive int
    uint256 public _number = 20220330; // 256 int


    uint256 public _number1 = _number + 1; // +，-，*，/
    uint256 public _number2 = 2**2; // exponet
    uint256 public _number3 = 7 % 2; // remainder
    bool public _numberbool = _number2 > _number3; 

     // address
    address public _address = 0xd9145CCE52D386f254917e481eB44e9943F39138;
    address payable public _address1 = payable(_address); // payable address
    uint256 public balance = _address1.balance; // balance of address

    bytes32 public _johnson = "Johnson"; 
    bytes1 public _byte = _johnson[0]; 

    // enum
    enum ActionSet { Buy, Hold, Sell }
    // enum variable
    ActionSet action = ActionSet.Buy;

    // It can be explicitly converted to and from uint, 
    // and it will check if the converted positive integer is within the length 
    // of the enumeration; otherwise, it will throw an error.
    function enumToUint() external view returns(uint){
        return uint(action);
    }
}