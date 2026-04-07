const hre = require("hardhat");

async function main() {
  const PARTY_B = "0x..."; // Address of the second party
  const PDF_HASH = hre.ethers.id("Sample Legal Agreement v1.0"); // Example hash
  
  const Agreement = await hre.ethers.getContractFactory("LegalAgreement");
  const agreement = await Agreement.deploy(PARTY_B, PDF_HASH);

  await agreement.waitForDeployment();
  console.log("Legal Agreement deployed to:", await agreement.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
