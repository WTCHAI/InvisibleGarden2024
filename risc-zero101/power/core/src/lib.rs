use risc0_zkp::core::digest::Digest;
use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Deserialize, Eq, PartialEq, Serialize)]
pub struct PowerStagement{
    pub x : u32 , 
    pub y : u32 ,

}

impl PowerStagement {
    pub fn calculated(&mut self)-> u64 {
        self.x.pow(self.y) ;
    }
}