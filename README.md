# Solidity-Project

## Lottery 
```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Lottery
{
    address public manager;
    address payable [] public participants;

    constructor()
    {
        manager = msg.sender; // Global variable
    }

    receive() external payable //for receive money from participants
    {
        require(msg.value >=1 ether);    
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint)
    {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns (uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }

    function selectWinner() public 
    {
       require(msg.sender == manager);
       require(participants.length>=3);
       
       uint r=random();
       address payable winner;
       uint index = r % participants.length;
       winner = participants[index];
       winner.transfer(getBalance());
       participants = new address payable[](0);
    }
}
```
## Decentralized Banking Application
``` solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MYbank
{
    mapping (address => uint) balance;

    function getBalance() public view returns (uint)
    {
        return balance[msg.sender];
    }

    function Deposit() public payable 
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
```
