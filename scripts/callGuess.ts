import { ethers } from "hardhat";

async function main() {
  // Replace this with the deployed address of your Helper contract
  //const helperAddress = "0x9966EE37a2B1829080BDBe482935E79AEFe894aA";
  const helperAddress = "0x4E45C0254Ad77558E620Ce501b5b13AC2839B798";
  // Get a reference to the deployed Helper contract
  const Helper = await ethers.getContractFactory("Helper");
  const helper = Helper.attach(helperAddress);

  // Call the guess function
  const tx = await helper.guess();

  // Wait for the transaction to be confirmed
  await tx.wait();

  console.log("Guess function called successfully");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
