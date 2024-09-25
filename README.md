# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.ts
```

# Deploy Helper smart contract to Holensky network

```shell
CONTRACT_NAME=Helper npx hardhat run scripts/deployContract.ts --network holesky
```


# Call smart contract function

```shell
npx hardhat run scripts/call.ts --network holesky
```
