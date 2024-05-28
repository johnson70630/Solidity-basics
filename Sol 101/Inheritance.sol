// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Grandpa{
    event Log(string msg);

    function hip() public virtual {
        emit Log("Grandpa");
    }

    function pop() public virtual {
        emit Log("Grandpa");
    }

    function grandpa() public virtual {
        emit Log("Grandpa");
    }
}

contract Dad is Grandpa{
    // inherit functions
    function hip() public virtual override {
        emit Log("Dad");
    }

    function pop() public virtual override {
        emit Log("Dad");
    }

    function dad() public virtual {
        emit Log("Dad");
    }

    // call the function of the Inheritted contract
    function callParent() public{
        Grandpa.pop();
    }
    function CallParentSuper() public{
        super.pop();
    }
}

// Multiple Inheritence
contract Son is Grandpa, Dad{
    function hip() public virtual override (Grandpa, Dad){
        emit Log("Son");
    }
    
    function pop() public virtual override (Grandpa, Dad){
        emit Log("Son");
    }
}

// Modifier can also be inheritted 
contract Base1{
    modifier exactDividedBy2N3(uint _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}
contract Identifier is Base1{
    function getExactDividedBy2N3(uint _dividend) public pure returns(uint, uint){
        return getExactDividedBy2N3WithoutModifier(_dividend);
    }
    function getExactDividedBy2N3WithoutModifier(uint _dividend) public pure returns(uint, uint){
        uint div2 = _dividend / 2;
        uint div3 = _dividend / 3;
        return (div2, div3);
    }
    modifier exactDividedBy2N3(uint _a) override {
        _;
        require(_a & 2 == 0 && _a % 3 == 0);
    }
}

// construct function inheritence
abstract contract A{
    uint public a;

    constructor(uint _a){
        a = _a;
    }
}
contract B is A(1){}
contract C is A {
    constructor(uint _c) A(_c * _c) {}
}

// Diamond Inhereitence
contract God{
    event Log(string message);

    function foo() public virtual{
        emit Log("God.foll called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God{
    function foo() public virtual override{
        emit Log("Adam.foo called");
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}

contract Eve is God{
    function foo() public virtual override{
        emit Log("Eve.foo called");
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

contract people is Adam, Eve {
    function foo() public override (Adam, Eve){
        super.foo();
    }
    function bar() public  override (Adam, Eve){
        super.bar();
    }
}