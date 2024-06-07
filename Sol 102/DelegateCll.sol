// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Target contract C
contract C {
    uint public num;
    address public sender;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
    }
}

contract DelegateCall {
    uint public num;
    address public sender;
    // Calling setVars() of contract C with call, the state variables of contract C will be changed
    function callSetVars(address _addr, uint _num) external payable{
        // call setVars()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
    // Calling setVars() of contract C with delegatecall, the state variables of contract B will be changed
    function delegateCallSetVars(address _addr, uint _num) external payable{
        // delegate call setVars()
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
    
}