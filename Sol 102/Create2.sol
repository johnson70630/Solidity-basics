// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Pair{
    address public factory; // 工厂合约地址
    address public token0; // 代币1
    address public token1; // 代币2

    constructor() payable {
        factory = msg.sender;
    }

    // called once by the factory at time of deployment
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, 'UniswapV2: FORBIDDEN'); // sufficient check
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory{
    // find the pair address by two token addresses
    mapping (address => mapping (address => address)) public getPair;
    // save all pair addresses
    address[] public allPairs;

    function createPair(address tokenA, address tokenB) external returns(address pairAddr){
        // avoid conflict when two tokens are the same
        require(tokenA != tokenB, "IDENTICAL_ADDRESSES");
        // sort tokenA and tokenB by size
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenA, tokenB);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));

        // deploy new contract with create2
        Pair pair = new Pair{salt: salt}();
        // call initialize funtion of new contract
        pair.initialize(tokenA, tokenB);
        // Update address map
        pairAddr = address(pair);
        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }
}