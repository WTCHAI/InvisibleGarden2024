pragma circom 2.0.0;

// /*This circuit template checks that c is the multiplication of a and b.*/  

template Fibonachi (max_n) {  
    
    signal input initial1;
    signal input initial2;
    signal output fib_n;
    signal fibonachi[max_n+1]; 
    
    fibonachi[0] <== initial1;
    fibonachi[1] <== initial2;

    for ( var i = 2 ; i <= max_n ; i++ ) {
        fibonachi[i] <== fibonachi[i-1] + fibonachi[i-2];
    }

    fib_n <== fibonachi[max_n];
}

component main = Fibonachi(100) ;

// template Fibonacci(n) {
//   assert(n >= 2);

//   signal input in[2];
//   signal output out;

//   signal fib[n+1];

//   fib[0] <== in[0];
//   fib[1] <== in[1];
//   for (var ixz            = 2; i <= n; i++) {
//     fib[i] <== fib[i-2] + fib[i-1];
//   }

//   out <== fib[n];
// }

// component main = Fibonacci(100);