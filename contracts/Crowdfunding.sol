// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title CrowdFund
 * @dev A simple crowdfunding smart contract with only a few essential functions.
 */
contract CrowdFund {
    address public owner;
    uint public goal;
    uint public deadline;
    uint public totalFunds;
    mapping(address => uint) public contributions;
    bool public goalReached;

    constructor(uint _goal, uint _durationInDays) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + (_durationInDays * 1 days);
        goalReached = false;
    }

    // --- 1️⃣ Contribute Function ---
    function contribute() public payable {
        require(block.timestamp < deadline, "Crowdfunding period has ended");
        require(msg.value > 0, "Contribution must be greater than 0");
        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;
    }

    // --- 2️⃣ Withdraw Function ---
    function withdrawFunds() public {
        require(block.timestamp >= deadline, "Crowdfunding not yet ended");
        require(msg.sender == owner, "Only owner can withdraw");
        require(totalFunds >= goal, "Funding goal not reached");
        goalReached = true;
        payable(owner).transfer(totalFunds);
    }

    // --- 3️⃣ Refund Function ---
    function refund() public {
        require(block.timestamp >= deadline, "Crowdfunding not yet ended");
        require(totalFunds < goal, "Goal was reached, refunds not available");
        uint amount = contributions[msg.sender];
        require(amount > 0, "No contributions to refund");
        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}

