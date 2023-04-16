// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Logic2 {
    address public implementation; 
    address public admin; 
    uint256 public monthlyWithdrawPropotion;

    // selector： 0xf40f5d04
    function decrement() public{
        if(monthlyWithdrawPropotion>=3){
            monthlyWithdrawPropotion -=3; //decrement the investment proportion
        }
        
    }
}