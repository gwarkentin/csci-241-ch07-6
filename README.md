# csci-241-ch07-6
Greatest_Common_Divisor

The greatest common divisor of two non-zero integers is the largest integer that will evenly divide both integers. The algorithm involves integer division in a loop, described by the C++ code:
   int GCD(int x, int y)
   {
      x = abs(x); // absolute value
      y = abs(y);

      do
      {
         int n = x % y;
         x = y;
         y = n;
      }
      while y > 0;

      return x;
   }
Implement this function in assembly language. Write a non-recursive procedure CalcGcd to calculate the GCD of two non-zero integers received from eax and ebx, and return EAX as GCD calculated for display. This is an example in action:
x   %   y   =   n
10      24      10
24      10      4
10      4       2
4       2       0
2       0
The program will be run like this:
C:\Teaching\CSCI241\ch07\Debug>ch07_06
Enter a 32 bit number: 10
Enter a 32 bit number: 24
Greatest common divisor is: 2

C:\Teaching\CSCI241\ch07\Debug>ch07_06
Enter a 32 bit number: -100
Enter a 32 bit number: 48
Greatest common divisor is: 4
Even when a negative entered.

An alternative implementation (not required) is to use subtractions, as see from Using Euclid's algorithm.
