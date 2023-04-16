// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SendETH {
    
    constructor() payable{}
    
    receive() external payable{}

    // 用transfer() to send ETH
    function transferETH(address payable _to) external payable{
	_to.transfer(address(this).balance);
}
}