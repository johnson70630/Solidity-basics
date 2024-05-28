// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract InsertionSort{
    // if-else condition
    function ifTest(uint256 _num) public pure returns(bool){
        if (_num == 0){
            return(true);
        }else{
            return(false);
        }
    }
    // for loop
    function forTest() public pure returns(uint256){
        uint sum = 0;
        for (uint i = 0; i < 10; i++){
            sum += i;
        }
        return(sum);
    }
    // while loop
    function whileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        while (i < 10){
            sum += i;
            i++;
        }
        return(sum);
    }
    // do-while loop
    function doWhileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        do{
            sum += i;
            i++;
        }while (i < 10);
        return(sum);
    }
    // ternary operator
    function ternaryTest(uint256 x, uint256 y) public pure returns(uint256){
        // return the max of x and y
        return x >= y ? x: y;
    }
    function insertionSort(uint[] memory a) public pure returns(uint[] memory){
        for (uint i = 1; i < a.length; i++){
            uint temp = a[i];
            uint j = i;
            while ((j >= 1) && (temp < a[j-1])){
                a[j] = a[j-1];
                j--;
            }
            a[j] = temp;
        }
        return(a);
    }
}