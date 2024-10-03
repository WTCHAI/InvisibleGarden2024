// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthRecordAttestation  {

    // Structure to hold attestation data
    struct Attestation {
        address provider;  // Healthcare provider's address (DID)
        string recordHash ; // Hash of the off-chain health record
        string recordType; // Type of health record (diagnosis, treatment, etc.) // could be array ?
        uint256 timestamp; // Timestamp of the attestation
    }

    // Mapping of patient addresses to their health record attestations
    mapping(address => Attestation[]) public patientAttestations;

    // Access control mapping for permissions (patientAddr => (provider => permission)) 
    // 1 patient address can have multiple providers with access permissions to access their data ? 
    mapping(address => mapping(address => bool)) public accessPermissions;

    // Events
    event AttestationCreated(address indexed patient, address indexed provider, string recordHash, string recordType);
    event AccessGranted(address indexed patient, address indexed provider);
    event AccessRevoked(address indexed patient, address indexed provider);

    // Modifier to ensure only the patient can manage their permissions
    modifier onlyPatient(address _patient) {
        require(msg.sender == _patient, "Only the patient can manage access permissions.");
        _;
    }

    // Function for healthcare provider to create a health record attestation
    function createAttestation(address _patient, string memory _recordHash, string memory _recordType) external {
        // Create a new attestation
        Attestation memory newAttestation = Attestation({
            provider: msg.sender,
            recordHash: _recordHash,
            recordType: _recordType,
            timestamp: block.timestamp
        });

        // Store the attestation in the patient's record
        patientAttestations[_patient].push(newAttestation);
        
        // Emit event for attestation creation
        emit AttestationCreated(_patient, msg.sender, _recordHash, _recordType);
    }

    // Function for the patient to grant access to their health records
    function grantAccess(address _provider) external onlyPatient(msg.sender) {
        accessPermissions[msg.sender][_provider] = true;
        emit AccessGranted(msg.sender, _provider);
    }

    // Function for the patient to revoke access to their health records
    function revokeAccess(address _provider) external onlyPatient(msg.sender) {
        accessPermissions[msg.sender][_provider] = false;
        emit AccessRevoked(msg.sender, _provider);
    }

    // Function to verify a health record attestation by retrieving the hash and metadata
    function verifyAttestation(address _patient, uint256 _attestationIndex)
        external
        view
        returns (address provider, string memory recordHash, string memory recordType, uint256 timestamp)
    {
        // Check if the caller is the patient or has been granted access
        require(msg.sender == _patient || accessPermissions[_patient][msg.sender], "Access denied.");

        // Get the specific attestation
        Attestation storage attestation = patientAttestations[_patient][_attestationIndex];

        return (attestation.provider, attestation.recordHash, attestation.recordType, attestation.timestamp);
    }

    // Helper function to get the number of attestations for a patient
    function getAttestationCount(address _patient) external view returns (uint256) {
        return patientAttestations[_patient].length;
    }

    // Function to retrieve all attestations for a patient (for authorized providers)
    function getAllAttestations(address _patient)
        external
        view
        returns (Attestation[] memory)
    {
        require(msg.sender == _patient || accessPermissions[_patient][msg.sender], "Access denied.");
        return patientAttestations[_patient];
    }
}
