use risc0_zkvm::guest::env;

fn main() {
    // TODO: Implement your guest code here

    // read the input
    let n : u32 = env::read() ;     
    
    // TODO: do something with the input
    println!("Guest side : {}", n) ;
    env::commit(&n);
}
