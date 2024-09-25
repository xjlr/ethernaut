import { ethers } from "hardhat";
import { Contract, ContractFactory } from "ethers"; // Explicitly import Contract

async function main() {
  const Helper: ContractFactory = await ethers.getContractFactory("Helper");

  console.log(`Helper : ${JSON.stringify(Helper, null, 2)}`);

  const helper: Contract = await Helper.deploy(); // Explicitly type the returned object

  console.log(`helper : ${JSON.stringify(helper, null, 2)}`);

  //await helper.deployed();  // Wait until the contract is fully deployed
  await helper.waitForDeployment();

  console.log("Helper contract deployed to:", await helper.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
