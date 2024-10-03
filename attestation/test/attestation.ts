import { ethers } from "hardhat";
import { Signer } from "ethers";
import { expect } from "chai";

import { HealthRecordAttestation } from './../typechain-types/attestation.sol/HealthRecordAttestation';

describe("HealthRecordAttestation", async () => {
    // Initialize user wallet address globally
    let patient1 : Signer , patient2 : Signer, provider1 : Signer, provider2 : Signer, deployer : Signer
    let healthRecordAttestationContract: HealthRecordAttestation

    beforeEach(async () => {
        [patient1,patient2,provider1,provider2,deployer] = await ethers.getSigners()  
        // Deploy contract
        const HealthRecordAttestationContract = await ethers.getContractFactory('HealthRecordAttestation')
        healthRecordAttestationContract = await HealthRecordAttestationContract.connect(patient1).deploy()
        healthRecordAttestationContract.deploymentTransaction()
    })
    
    describe("Creating event creating attestation", async ()=>{
        const hashedValue = "27332b31135a8c759981bc45e2a184177bc727be1d69311165ec4e0c1b95ba5b"
        const hashedType = "Sha256"
        let patient1Address : string
        beforeEach(async () => {
            // Creating attestation by patient 1
            patient1Address = await patient1.getAddress()
            await healthRecordAttestationContract.connect(patient1).createAttestation(patient1Address,hashedValue,hashedType)
            await healthRecordAttestationContract.grantAccess(provider1)
        })

        it("It Should gives user attestation", async function () {  
            // Creating attestation 
            const Patient1Data = await healthRecordAttestationContract.getAllAttestations(patient1Address)
            expect(Patient1Data.length).to.equal(1)
        })
    })
})