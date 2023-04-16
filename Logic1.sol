// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Logic1 {
    address public implementation; 
    address public admin; 
    uint256 public monthlyWithdrawPropotion;

    // selector： 0xd09de08a
    function increment() public{
        monthlyWithdrawPropotion +=3; //incecrement the investment proportion
    }
}