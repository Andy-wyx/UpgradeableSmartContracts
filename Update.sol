// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Update {
    address public implementation; 
    address public customer; 
    uint256 public monthlyWithdrawPropotion;

    address private wealthNavig = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    bool public withdrawable;

    constructor(address _implementation) payable{
        customer = msg.sender;
        implementation = _implementation;
        monthlyWithdrawPropotion = 10; //initial investment :10 percent of the total balance
        withdrawable=true;// prepare the initial investment
    }

    //delegate to current logic contract
    fallback() external payable {
        //can only be called once a month. for demostration purpose, I will not realize the monthly restriction.
        (bool success, bytes memory data) = implementation.delegatecall(msg.data);
        require(success, "Delegatecall failed.");
        withdrawable=true;//enable monthly investment after udpate the proportion
    }

    //change the current logic contract, can only be called by customer
    function update(address newImplementation) external {
        require(msg.sender == customer);
        implementation = newImplementation;
    }

    //enable this contract to receive ETH
    event Received(address Sender, uint256 Value);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    //get current balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    //transfer a specific amount of ethers to wealthNavig based on the proportion
    function transferToWealthNavig() external {
        require(withdrawable==true, "You need to update the monthly investment proportion first!");
        require(msg.sender == wealthNavig, "Caller is not the specified wealthNavig address");
        
        uint256 amount = address(this).balance * monthlyWithdrawPropotion / 100;
        require(address(this).balance >= amount, "Not enough balance in the contract");
        payable(wealthNavig).transfer(amount);
        withdrawable=false;//close transfer for this month
    }
}