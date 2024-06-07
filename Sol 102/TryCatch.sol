// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;


contract OnlyEven{
    constructor(uint a){
        require(a != 0, "invalid number");
        assert(a != 1);
    }

    function onlyEven(uint256 b) external pure returns(bool success){
        // revert when an odd number is entered
        require(b % 2 == 0, "Ups! Reverting");
        success = true;
    }
}

contract TryCatch{
    // success event
    event SuccessEvent();
    //failure event
    event CatchEvent(string message);
    event CatchByte(bytes data);

    // declare OnlyEven contract variable
    OnlyEven even;

    constructor(){
        even = new OnlyEven(2);
    }

        // use try-catch in external call
    function execute(uint amount) external returns (bool success) {
        try even.onlyEven(amount) returns(bool _success){
            // if call succeeds
            emit SuccessEvent();
            return _success;
        } catch Error(string memory reason){
            // if call fails
            emit CatchEvent(reason);
        }
    }

    function executeNew(uint a) external returns (bool success) {
        try new OnlyEven(a) returns(OnlyEven _even){
            // if call succeeds
            emit SuccessEvent();
            success = _even.onlyEven(a);
        } catch Error(string memory reason) {
            // catch revert("reasonString") 和 require(false, "reasonString")
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            // catch assert() of failure, the error type of assert is Panic(uint256) instead of Error(string), so it will go into this branch
            emit CatchByte(reason);
        }
    }
}