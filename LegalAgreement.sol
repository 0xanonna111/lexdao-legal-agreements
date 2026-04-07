// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title LegalAgreement
 * @dev On-chain signature and hash tracking for legal contracts.
 */
contract LegalAgreement is Ownable {
    bytes32 public contractHash; // Hash of the human-readable PDF
    address public partyA;
    address public partyB;
    
    bool public signedA;
    bool public signedB;
    
    enum State { PENDING, ACTIVE, TERMINATED, DISPUTED }
    State public status;

    event ContractSigned(address indexed party);
    event ContractActive();

    constructor(address _partyB, bytes32 _contractHash) Ownable(msg.sender) {
        partyA = msg.sender;
        partyB = _partyB;
        contractHash = _contractHash;
        status = State.PENDING;
    }

    function sign() external {
        require(msg.sender == partyA || msg.sender == partyB, "Not a party");
        
        if (msg.sender == partyA) signedA = true;
        if (msg.sender == partyB) signedB = true;
        
        emit ContractSigned(msg.sender);

        if (signedA && signedB) {
            status = State.ACTIVE;
            emit ContractActive();
        }
    }

    function terminate() external onlyOwner {
        status = State.TERMINATED;
    }
}
