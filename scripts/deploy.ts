import { ethers } from "hardhat";

async function main() {
  // We get the contract to deploy
  const StudentRegistry = await ethers.getContractFactory("StudentRegistry");

  // Deploy the contract
  const studentRegistry = await StudentRegistry.deploy();

  // Wait for the deployment to be mined
  await studentRegistry.waitForDeployment();

  console.log("StudentRegistry deployed to:", studentRegistry.target);
}

// Error handling
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
