// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
// Import by URL
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';
// Import via npm directory
import '@openzeppelin/contracts/access/Ownable.sol';

import {Contract_A} from 'NewContract.sol';

contract Import {
    
    using Address for address;
    
    Contract_A a = new Contract_A();
}
