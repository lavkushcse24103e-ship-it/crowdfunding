// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    address public owner;
    uint256 public goal;
    uint256 public deadline;
    uint256 public totalFunds;

    mapping(address => uint256) public contributions;

    constructor(uint256 _goal, uint256 _durationInDays) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + (_durationInDays * 1 days);
    }

    // 1️⃣ Contribute to the campaign
    function contribute() external payable {
        require(block.timestamp < deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than zero");

        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;
    }

    // 2️⃣ Get current campaign status
    function getCampaignStatus() external view returns (string memory) {
        if (block.timestamp >= deadline) {
            if (totalFunds >= goal) {
                return "Goal reached! Awaiting withdrawal.";
            } else {
                return "Campaign ended. Goal not reached.";
            }
        } else {
            return "Campaign is active.";
        }
    }

    // 3️⃣ Withdraw funds (only owner, after success)
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(block.timestamp >= deadline, "Campaign still active");
        require(totalFunds >= goal, "Goal not reached");

        uint256 amount = address(this).balance;
        payable(owner).transfer(amount);
    }

    // 4️⃣ Refund contributors if goal not met
    function refund() external {
        require(block.timestamp >= deadline, "Campaign still active");
        require(totalFunds < goal, "Goal reached, refund not allowed");
        uint256 contributedAmount = contributions[msg.sender];
        require(contributedAmount > 0, "No funds to refund");

        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(contributedAmount);
    }

    // 5️⃣ Get contribution amount of an address
    function getContribution(address contributor) external view returns (uint256) {
        return contributions[contributor];
    }
}
