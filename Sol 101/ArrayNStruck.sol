// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // stating version

contract ArrayNStruck{
    // fixed length
    uint[8] array1;
    bytes1[5] array2;
    address[100] array3;

    // un-fixed length
    uint[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7; // bytes do not use []
    
    // initialize un-fixed length array
    uint[] array8 = new uint[](5);
    bytes array9 = new bytes(9);
    
    function initArray() external pure returns(uint[] memory){
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        return x;
    }
    function arrayPush() public returns(uint[] memory){
        uint[2] memory a = [uint(1), 2];
        array4 = a;
        array4.push(3);
        return array4;
    }
    
    // stuck
    struct Student{
        uint id;
        uint256 score;
    }
    // initialize
    Student student;

    // assign value to struct
    function initStudent1() external{
        Student storage _student = student;
        _student.id = 11;
        _student.score = 100;
    }
    function initStudent2() external{
        student.id = 1;
        student.score = 80;
    }
}