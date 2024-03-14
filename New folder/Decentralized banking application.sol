// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract MBDBank
{
    mapping (address => uint) balance;

    function getBalance() public view returns (uint)
    {
        return balance[msg.sender];
    }

    function deposit() public payable 
    {
        balance[msg.sender] = balance[msg.sender] + msg.value;
    }

    function Withdraw(uint _amount) public 
    {
        balance[msg.sender] = balance[msg.sender] - _amount;
        payable (msg.sender).transfer(_amount);
    }

    function transfer(address _to , uint _amount) public 
    {
        balance[msg.sender] = balance[msg.sender] - _amount;
        balance[_to] = balance[_to] + _amount;
    }
}
