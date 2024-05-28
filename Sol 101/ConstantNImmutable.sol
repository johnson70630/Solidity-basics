// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ConstantNImmutable{
    // constant variables should be stated in initialization and it's immutable
    uint constant _NUM = 10;
    string constant _STRING = "0xBD";
    bytes constant _BYTES = "HI";
    address constant _ADDRESS = 0x0000000000000000000000000000000000000000;

    // immutable variables can initialize in constructer and can not be changed afterward
    // string and bytes can not be immutable
    uint256 public immutable _NUM2 = 9999999999;
    address public immutable _ADDRESS2;
    uint256 public immutable _BLOCK;
    uint256 public immutable _TEST;

    constructor(){
        _ADDRESS2 = address(this);
        _BLOCK = block.number;
        _TEST = test();
    }
    function test() public pure returns(uint256){
        uint256 what = 9;
        return(what);
    }
}