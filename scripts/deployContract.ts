import { ethers } from "hardhat";
import { Contract, ContractFactory } from "ethers";

async function main() {
  // Get the contract name from the environment variable
  const contractName = process.env.CONTRACT_NAME;

  if (!contractName) {
    throw new Error("Please set the CONTRACT_NAME environment variable.");
  }

  // Get the contract factory using the provided contract name
  const ContractFactory: ContractFactory = await ethers.getContractFactory(contractName);

  console.log(`${contractName} : ${JSON.stringify(ContractFactory, null, 2)}`);

  //const contract: Contract = await ContractFactory.deploy('0x3C2b95b5a2bD0114A86A7995eA46337141210660');
  const contract: Contract = await ContractFactory.deploy();

  console.log(`${contractName} instance: ${JSON.stringify(contract, null, 2)}`);

  // Wait until the contract is fully deployed
  await contract.waitForDeployment();

  console.log(`${contractName} contract deployed to:`, await contract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
