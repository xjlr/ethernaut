import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    holesky: {
      url: "https://rpc.holesky.ethpandaops.io", // Custom RPC URL for Holesky
      accounts: [`0x${process.env.PRIVATE_KEY}`], // Your private key from .env
      chainId: 17000, // Holesky's chain ID
    },
  },
};

export default config;

