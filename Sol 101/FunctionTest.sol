// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // stating version

contract FunctionTest {
    uint256 public num = 5;

    // no pure or view: can read and rewrite variables
    function add() external{
        num += 1;
    }
    // pure: cannot read and rewrite variables
    function addPure(uint256 _num) external pure returns(uint256 new_num){
        new_num = _num + 1;
    }
    
    // view: can only read variables
    function addView() external view returns(uint256 new_num){
        new_num = num + 1;
    }

    // internal: can be used by other functions in same contract
    function minus() internal{
        num = num - 1;
    }
    // external: can use other functions that are internal in same contract
    function minusCall() external{
        minus();
    }

    // payable
    function minusPayable() external payable returns (uint256 balance){
        minus();
        balance = address(this).balance;
    }

    
}