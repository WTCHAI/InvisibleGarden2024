1. Creating Circuit & compiles 
The process is compile circuit
    circom multiplier2.circom --r1cs --wasm --sym --c

--r1cs: it generates the file multiplier2.r1cs that contains the R1CS constraint system of the circuit in binary format.
--wasm: it generates the directory multiplier2_js that contains the Wasm code (multiplier2.wasm) and other files needed to generate the witness.
--sym : it generates the file multiplier2.sym , a symbols file required for debugging or for printing the constraint system in an annotated mode.
--c : it generates the directory multiplier2_cpp that contains several files (multiplier2.cpp, multiplier2.dat, and other common files for every compiled program like main.cpp, MakeFile, etc) needed to compile the C code to generate the witness.

2. Generating witness from our equation with exact private input 
Require Private input to generate inside folder Power_js

    node generate_witness.js Power.wasm privateInput.json witness.wtns

3. Generating proof Snark & power of tau

    snarkjs powersoftau new bn128 12 pot12_0000.ptau -v

        [DEBUG] snarkJS: Calculating First Challenge Hash
        [DEBUG] snarkJS: Calculate Initial Hash: tauG1
        [DEBUG] snarkJS: Calculate Initial Hash: tauG2
        [DEBUG] snarkJS: Calculate Initial Hash: alphaTauG1
        [DEBUG] snarkJS: Calculate Initial Hash: betaTauG1
        [DEBUG] snarkJS: Blank Contribution Hash:
                        786a02f7 42015903 c6c6fd85 2552d272
                        912f4740 e1584761 8a86e217 f71f5419
                        d25e1031 afee5853 13896444 934eb04b
                        903a685b 1448b755 d56f701a fe9be2ce
        [INFO]  snarkJS: First Contribution Hash:
                        9e63a5f6 2b96538d aaed2372 481920d1
                        a40b9195 9ea38ef9 f5f6a303 3b886516
                        0710d067 c09d0961 5f928ea5 17bcdf49
                        ad75abd2 c8340b40 0e3b18e9 68b4ffef

4. Contribute ceremony 
    snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v
        Enter a random text. (Entropy): text 
        [DEBUG] snarkJS: Calculating First Challenge Hash
        [DEBUG] snarkJS: Calculate Initial Hash: tauG1
        [DEBUG] snarkJS: Calculate Initial Hash: tauG2
        [DEBUG] snarkJS: Calculate Initial Hash: alphaTauG1
        [DEBUG] snarkJS: Calculate Initial Hash: betaTauG1
        [DEBUG] snarkJS: processing: tauG1: 0/8191
        [DEBUG] snarkJS: processing: tauG2: 0/4096
        [DEBUG] snarkJS: processing: alphaTauG1: 0/4096
        [DEBUG] snarkJS: processing: betaTauG1: 0/4096
        [DEBUG] snarkJS: processing: betaTauG2: 0/1
        [INFO]  snarkJS: Contribution Response Hash imported: 
                        c3cb82c0 94595c82 9a5384ac 7dd89073
                        618e561e a849f59f 62fb3f47 b13cfe48
                        9634acdb df03d141 7d6e9372 8ab3797a
                        2e55765b ded493db 0584f7cc 7dcaff21
        [INFO]  snarkJS: Next Challenge Hash: 
                        489587b7 8b01fdc5 0dd1bd4c 4153e96d
                        19650b61 38221c6b ba108c4c dce624a2
                        559377f2 ab6c589f 57391aed 5ca94f24
                        d641bbda b26a8728 807ac14b 7bcadae7


5. Circuit Specific generating .zkey contain proving & verification keys 

    snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

    snarkjs groth16 setup Power.r1cs pot12_final.ptau Power_0000.zkey

