import '@nomiclabs/hardhat-ethers'
import '@nomiclabs/hardhat-etherscan'
import '@nomiclabs/hardhat-waffle'
import dotenv from 'dotenv'
import { task } from 'hardhat/config'
import 'solidity-coverage'
dotenv.config()

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task('accounts', 'Prints the list of accounts', async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners()

  for (const account of accounts) {
    console.log(account.address)
  }
})

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfigq
 */
module.exports = {
  solidity: {
    compilers: [
      {
        version: '0.8.17',
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
      {
        version: '0.5.6',
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
    ],
  },
  networks: {
    localhost: {
      url: 'http://localhost:8545',
      timeout: 120 * 1000,
      gasPrice: 10_000_000_000,
      gasMultiplier: 1.5,
      accounts: {
        mnemonic:
          process.env.MNEMONIC !== undefined
            ? process.env.MNEMONIC
            : 'test test test test test test test test test test test junk',
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 20,
        passphrase: '',
      },
    },
    goerli: {
      url: process.env.GOERLI_URL || '',
      gasPrice: 10_000_000_000,
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    ropsten: {
      url: process.env.ROPSTEN_URL || '',
      gasPrice: 2_000_000_000,
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    sepolia: {
      url: process.env.SEPOLIA_URL || '',
      gasPrice: 2_000_000_000,
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  },
  mocha: {
    // slow in CI
    timeout: process.env.CI ? 300_000 : 60_000,
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
}
