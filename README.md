# Decentralized Legal Agreement (LexDAO-style)

A professional-grade implementation for "Code as Law." This repository bridges the gap between traditional legal prose and executable smart contract logic. By using Ricardian contracts, parties can sign an agreement that is both human-readable (PDF/Text) and machine-executable (Solidity).

## Core Features
* **Ricardian Binding:** Links a hash of the legal PDF to the smart contract deployment to ensure the "Spirit" and the "Letter" of the law match.
* **LexLocker:** A specialized escrow that allows for multi-signature release or intervention by a "Legal Arbiter" if terms are breached.
* **On-chain Notarization:** Tamper-proof timestamping of contract signatures and amendments.
* **Flat Architecture:** Single-directory layout for the Agreement Registry, Signature Manager, and Arbiter logic.



## Logic Flow
1. **Draft:** Parties agree on a PDF contract and hash it (SHA-256).
2. **Deploy:** The agreement is initialized on-chain with the hash and the addresses of the parties.
3. **Sign:** Both parties call the `sign()` function, providing their cryptographic consent.
4. **Execute:** Funds or assets are moved based on the successful fulfillment of the terms recorded in the code.

## Setup
1. `npm install`
2. Deploy `LegalAgreement.sol`.
