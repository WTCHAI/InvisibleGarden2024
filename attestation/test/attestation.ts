import { expect } from "chai";
import { ethers } from "hardhat";

describe("HealthRecordAttestation", function () {
  console.log("Test");
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [ owner ] = await ethers.getSigners();    
    console.log("Owner address: ", owner.address);
    const contract = await ethers.deployContract("HealthRecordAttestation");

    // const ownerBalance = await hardhatToken.balanceOf(owner.address);
    // expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });
});