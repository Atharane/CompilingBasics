// Demonstration of C preprocessor capabilities

#include <stdio.h> // Header file - declarations of functions
#define x 10       // C Macros

#define DEBUG 1
int int_a = 0;
long int long_a, long_sum;
float float_a;

int main()
{
    printf("lorem ipsum\n");

    // Basics Addition
    printf("Numbers: "); // Prompt the user
    scanf("%ld %f", &long_a, &float_a); // Reads in a long int and a float

    long_sum = long_a + float_a; // Adds the two numbers
    printf("Sum: %ld \n\n", long_sum);


    long_sum = long_sum + x; // x is 10, macro expansion

#undef x // undefine x, previous x will be unaffected
#define x 20 // redefine x

    int_a = int_a + x; // x to be replaced by 20

#ifdef DEBUG // conditional compilation
    printf("*debug* A = %d\n\n", int_a);
#endif

    int_a = int_a + x;
    printf("New A:  %d", int_a);

    return 0;
}

// Instructions

/* 
   Command: gcc -save-temps mark.c
   Output files:
   > mark.i
   > mark.o
   > mark.s
   > a.out 
*/
// Analyze mark.i which includes the stdio file contents (file inclusion)
// Moreover, X is replaced by 10 initially and later by 20 (macro expansion)
// Observe the conditional compilation by commenting #define DEBUG 1
// Analyze, mark.s (assembly generated)
// Analyze the generated .o file which is yet to be linked
// Analyze the linking with libc.so.6 at run time
// Analyze the loading with execve program
