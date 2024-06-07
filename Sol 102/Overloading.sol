// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Overloading {
    function Reply() public pure returns(string memory){
        return("Nothing");
    }

    function Reply(string memory something) public pure returns(string memory){
        return(something);
    }

    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }
}