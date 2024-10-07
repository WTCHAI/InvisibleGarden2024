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

