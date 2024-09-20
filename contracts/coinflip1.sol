// SPDXX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@chainlink/contracts/src/v0.8/VRFV2WrapperConsumerBase.sol";

contract CoinFlip1 is VRFConsumerBasev2Plus {
    //set up enum a,b,c
    //if a%2 = 0, add it to A..so on so forth

    //events triggered everytime we add an element to Variable 


    enum Variable{
        A,
        B,
        C
    }

    uint256 public variableA;
    uint256 public variableB;
    uint256 public variableC;

    mapping (uint256 => variable) requests;

    event FulfillA(uint256 requestId, uint256 value);
    event FulfillB(uint256 requestId, uint256 valeu);
    event FulfillC(uint256 requestId, uint256 valeu);

    
    function updateVariables(uint256 input) public {




        if (input % 2 == 0) {
            requests[requestsId] = Variable.A;
        } else  if (input % 3 == 0) {
            requests[requestsId] = Variable.B;
        } else {
            requests[requestsId] = Variable.C;
        }
    }
    
    
    function fulfillRandomWords(uint256 requests, uint256[] memory randomWords) internal override {
        Variable variable = requests[requestId];
        if ( variable == Variable.A ) {
            fullfillA(requestId, randomWords[0]);
        } else if (variable == Variable.B) {
            fullfillB(requestId, randomWords[0]);
        } else if(variable == Variable.C ) {
            fullfillC(requestId, randomWords[0]);
        }
    }


    function fullfillA(uint256 requestId, uint256 randomWord) private {
        variableA = randomWord;
        emit FulfillA(requestId, randomWord);
    }

    function fullfillB(uint256 requestId, uint256 randomWord) private{
        variableB = randomWord;
        emit FulfillB(requestId, randomWord);
    }

    function fullfillC(uint256 requestId, uint256 randomWord) private {
        variableC = randomWord;
        emit FulfillC(requestId, randomWord);
    }

}