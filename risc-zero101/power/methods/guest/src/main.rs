use risc0_zkvm::guest::env;

fn main() {
    // TODO: Implement your guest code here
    // Prover 
    // Risc0_zkvm_guest using for reading input data and commit result 
    // Risc0_build dependency
    // read the input
    let input: u32 = env::read();

    // TODO: do something with the input

    // write public output to the journal
    env::commit(&input);
}
