1. Bulding circuit
The process is compile circuit

    circom fibonachi.circom --r1cs --wasm --sym --c

    .r1cs :  getting r1cs stans for The files contains our circuit in binary form & define constaints mathematically
    .wasm : files contains WebAssembly which used to generate witness for specific the input that we wanted to keep it private while using them to create proof 

2. Generating witness from our equation with exact private input
    node generate_witness.js fibonachi.wasm privateInput.json witness.wtns


3. Trursted Setup 
    Generating Proving Key & Verification keys to create [] black blocks 

        snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
        snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v
        snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
4. Generating 
        snarkjs groth16 setup fibonachi.r1cs pot12_final.ptau fibonachi_0000.zkey

6. Contribute Phase two ceremony
    snarkjs zkey contribute fibonachi_0000.zkey fibonachi_0001.zkey --name="1st Contributor Name" -v

        Enter a random text. (Entropy): text
        [DEBUG] snarkJS: Applying key: H Section: 0/4
        [INFO]  snarkJS: Circuit Hash: 
                        e54996bc 128b09d9 95697034 6974d798
                        ff19511f 568b5060 f47d3020 e0436a9f
                        5f695e64 3f2a2958 76193417 13b9b7ed
                        77dda0fc 58e6a056 9758c45c 5f02d6c5
        [INFO]  snarkJS: Contribution Hash: 
                        a11c5fa2 07545d3d b308a140 7d532d26
                        e199e03c 8772bb0d 796fcecc 95081db6
                        7b4efad1 2506bb67 6ce94f04 fea3e7be
                        0a62c320 98a5917d 32f228b4 c69022ea

7. Export verification key 
    snarkjs zkey export verificationkey fibonachi_0001.zkey verification_key.json

8. Generate & Verifying Proof

    snarkjs groth16 prove fibonachi_0001.zkey witness.wtns proof.json public.json

    Testing verify 
    snarkjs groth16 verify verification_key.json public.json proof.json


9. Generating verifier contract 
    snarkjs zkey export solidityverifier fibonachi_0001.zkey verifier.sol


10. The Verifier has a view function called verifyProof that returns TRUE if and only if the proof and the inputs are valid. To facilitate the call, you can use snarkJS to generate the parameters of the call by typing:

snarkjs generatecall