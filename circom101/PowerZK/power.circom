pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Power (n) {  

   // Declaration of signals.  
   signal input a;  
   // signal public input i;
   signal output c;

   // Set temp to 1 initially.
   // Constraints.  

   signal i ; 
   i <== 1 ;

   for (var j = 0 ; j < n; j++) {
      i = i * a ;
   }

   c <== i ;
}

component main = Power(3);
