import { ethers } from "hardhat";
import { Signer } from "ethers";
import { expect } from "chai";

import { HealthRecordAttestation } from './../typechain-types/attestation.sol/HealthRecordAttestation';

describe("HealthRecordAttestation", async () => {
    // Initialize user wallet address globally
    let patient1 : Signer , patient2 : Signer, provider1 : Signer, provider2 : Signer
    let healthRecordAttestationContract: HealthRecordAttestation

    beforeEach(async () => {
        [patient1,patient2,provider1,provider2] = await ethers.getSigners()  
        // Deploy contract
        const HealthRecordAttestationContract = await ethers.getContractFactory('HealthRecordAttestation',patient2)
        healthRecordAttestationContract = await HealthRecordAttestationContract.deploy()

    })
    it("Should return the new greeting once it's changed", async function () {  

    })
})