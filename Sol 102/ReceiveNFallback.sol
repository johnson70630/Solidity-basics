// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;


contract ReceiveNFallback{
    
    event received(address sender, uint value);
    event fallbackCalled(address sender, uint value, bytes data);
    
    receive() external payable {
        emit received(msg.sender, msg.value);
    }

    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}