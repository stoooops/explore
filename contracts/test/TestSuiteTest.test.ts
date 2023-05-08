import { Contract, ContractFactory } from 'ethers'
import { ethers } from 'hardhat'
describe('StackDepthTestSuite', function () {
  let contractFactory: ContractFactory
  let contract: Contract

  beforeEach(async function () {
    contractFactory = await ethers.getContractFactory('StackDepthTestSuite')
    contract = await contractFactory.deploy()
    await contract.deployed()
  })

  it(`StackDepthTestSuite`, async function () {
    await contract.stackNotTooDeep(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 /*, 13 */)
  })
})
