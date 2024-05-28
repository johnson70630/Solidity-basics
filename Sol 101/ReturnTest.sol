// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // stating version

contract ReturnTest{

    // return muiltiple variables
    function returnMultiple() public pure returns(uint256, bool, uint256[3] memory){
        return(1, true, [uint256(1), 2, 5]);
    }
    // name variables in 'returns'
    function returnNamed() public pure returns(uint256 _number, bool _bool, uint[3] memory _array){
        _number = 2;
        _bool = false;
        _array = [uint256(3), 2, 1];
    }
    // still can use return in function
    function returnNamed2() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        return(1, true, [uint256(1), 2, 5]);
    }

    // unpaking returned variables
    function readReturn() public pure{
        uint256 _number;
        bool _bool;
        bool _bool2;
        uint256[3] memory _array;
        (_number, _bool, _array) = returnNamed();

        // read partial return variables
        (, _bool2, ) = returnNamed();
    }
}