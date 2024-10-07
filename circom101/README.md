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

