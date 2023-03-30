//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Vulnerable{
    bool lock;
    mapping(address=>uint) balances;
    function deposite() public payable{
        balances[msg.sender]+=msg.value;
    }

    // function withdraw() public{
    //     uint bal= balances[msg.sender];
    //     require(bal>0);
    //     (bool sent, )= msg.sender.call{value:bal}(""); //
    //     require(sent,"failed to send ether");
    //     balances[msg.sender]=0;
    // }
//}
//solution by implementing Mutex Locks
 function withdraw() public{
     require(lock==false,"locked");
     lock=true;
        uint bal= balances[msg.sender];
        require(bal>0);
        (bool sent, )= msg.sender.call{value:bal}(""); 
        require(sent,"failed to send ether");
        balances[msg.sender]=0;
        lock=false;
    }
}