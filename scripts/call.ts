//import { ethers } from "hardhat";
const { ethers } = require("hardhat");

async function main() {
  // Replace this with the deployed address of your Helper contract
  //const helperAddress = "0x9966EE37a2B1829080BDBe482935E79AEFe894aA";
  const helperAddress = "0x7aEf631AD8D72Eed858A6aEA256D5A9875e79f80";
  const player = "0x40cCE074bc66D108414D4a84B65C979B42c97893";
  // Get a reference to the deployed Helper contract
  const Helper = await ethers.getContractFactory("GoodSamaritanHelper");
  const helper = Helper.attach(helperAddress);

  // Call the guess function
  /*const tx1 = await helper.donate({
    value: ethers.parseEther("0.001")
  });*/


  // Wait for the transaction to be confirmed
  const tx1 = await helper.requestDonation('0xe1e8354CB5Eaae8EC1d912cfe4a07adE1E18F5B2');
  await tx1.wait();
  console.log("Request OK.");

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
