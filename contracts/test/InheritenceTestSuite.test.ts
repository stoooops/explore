import { Contract, ContractFactory } from 'ethers'
import { ethers } from 'hardhat'

describe('InheritenceTestSuite', function () {
  let contractFactory: ContractFactory
  let contract: Contract

  beforeEach(async function () {
    contractFactory = await ethers.getContractFactory('FooBar')
    contract = await contractFactory.deploy()
    await contract.deployed()
  })

  it(`foo`, async function () {
    await contract.foo()
  })

  it(`bar`, async function () {
    await contract.bar()
  })
})
