pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Power () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;  
   signal output c;

   // Set temp to 1 initially.
   // Constraints.  

   signal i ; 
   i <== 1 ;

   for (var i = 0 ; i < b ; i++) {
      i = i * a ;
   }

   c <== i ;
}

component main = Power();
