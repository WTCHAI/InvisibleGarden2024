pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Power (n) {  

   // Declaration of signals.  
   signal input a;  
   // signal public input i;
   signal output c;

   // Set temp to 1 initially.
   // Constraints.  
   signal temp[n+1] ; 
   temp[0] <== 1 ; 

   for (var i = 1; i <= n; i++) {
      temp[i] <== temp[i-1] * a;
   }

   c <== temp[n] ;
}

component main = Power(3);
