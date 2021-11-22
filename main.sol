// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract CrowdFunding{
    
    address public manager;
    uint public minContribution;
    uint public deadline;
    uint public target;
    uint public raisedAmount;
    uint public noOfContributers;

  //updating no of cotributers;
  mapping(address => uint) public contributers;
  //function to add new fundraiser
  function newFunding(uint _target, uint _deadline) public{
    manager = msg.sender;
    target = _target;
    deadline = block.timestamp + _deadline;
    minContribution = 100 wei;
  }

  function donateNow(uint _amount) public payable{
    require(block.timestamp < deadline, "Deadline has passed");
    require(_amount >= minContribution, "Minimun donation amount is 100 weth");
    require(raisedAmount <= target, "Donation Target Reached");
    if (contributers[msg.sender] == 0) {
      noOfContributers++;
    }
    contributers[msg.sender] += _amount;
    raisedAmount += _amount;
  }
}
