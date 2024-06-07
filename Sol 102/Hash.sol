// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Hash{
    bytes32 _msg = keccak256(abi.encodePacked("Ox12345"));

    function hash(
        uint _num,
        string memory _string,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }

    function weak(
        string memory string1
        ) public view returns (bool){
            return keccak256((abi.encodePacked(string1))) == _msg;
    }

    function strong(
        string memory string1,
        string memory string2
        ) public pure returns(bool){
            return keccak256(abi.encodePacked(string1)) == keccak256(abi.encodePacked(string2));
        }
}