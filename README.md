# 💰 CrowdFund DApp

## 🧩 Project Description
CrowdFund is a decentralized crowdfunding platform built on Ethereum, allowing project creators to raise funds transparently. Contributors can donate Ether to support a project until a defined deadline. If the funding goal is met, the project owner can withdraw the funds. Otherwise, contributors can claim refunds automatically.

---

## 🌍 Project Vision
To empower creators and innovators by removing intermediaries from the fundraising process. CrowdFund ensures **trust**, **transparency**, and **accountability** through blockchain technology, making it easy for anyone to support meaningful projects securely.

---

## ✨ Key Features
- **Simple & Transparent** — Only three main functions for easy understanding and minimal gas cost.  
- **Automatic Refunds** — Contributors can claim their funds back if the goal isn’t met.  
- **Goal-Based Withdrawal** — Funds can only be withdrawn by the owner once the goal is achieved.  
- **Immutable Recordkeeping** — Every transaction is recorded permanently on-chain.  

---

## 🚀 Future Scope
- **Milestone-based Funding**: Allow creators to withdraw funds in stages upon progress verification.  
- **Tokenized Rewards**: Offer contributors project tokens or NFTs as proof of support.  
- **Multi-Project Support**: Enable the contract to host multiple campaigns simultaneously.  
- **Integration with Frontend DApp**: Create a React or Next.js interface for a smooth user experience.  
- **Cross-Chain Expansion**: Extend support to other EVM-compatible chains (Polygon, Arbitrum, etc.).

---

## 🛠️ Deployment Notes
1. Deploy the contract using Remix, Hardhat, or Foundry.
2. Set a goal (in Wei) and a campaign duration (in days) during deployment.
3. Contributors can use `contribute()` to fund.
4. After the deadline:
   - Owner calls `withdrawFunds()` if the goal is met.
   - Contributors call `refund()` if the goal is not met.
   - 
##Contract details :0x1d3C93e94d9D95aAb6F8F31Cf0E2A43d1703119f
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/effa5971-f864-4d1e-b842-6f5596a19092" />
