//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bulk{


    function send(address[] memory _location, uint[] memory _valueInGwei) payable public{
        uint l = _valueInGwei.length;
        uint sum =0;
        for(uint j=0;j<l;j++){
            sum += _valueInGwei[j];
        }
        require(sum <=msg.value,"Not enough Eth");

        for(uint i=0; i<l; i++){
            (bool sent, bytes memory data) = _location[i].call{value : (_valueInGwei[i]*(10**9))}("");
        }
    }
}

