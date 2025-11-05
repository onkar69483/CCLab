%{
#include <stdio.h>
#include <stdlib.h>   // for atoi()

// Function to convert decimal to binary and print
void printBinary(int n) {
    if (n == 0) {
        printf("0");
        return;
    }

    int binary[32];   // array to store binary digits
    int i = 0;

    while (n > 0) {
        binary[i] = n % 2;   // store remainder
        n = n / 2;           // divide by 2
        i++;
    }

    // print binary in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binary[j]);
}
%}

%%

[0-9]+ {
    int num = atoi(yytext); // convert matched decimal to integer
    printf("Decimal: %s\tBinary: ", yytext);
    printBinary(num);
    printf("\n");
}

[ \t\n]+    ;   // ignore whitespace
.            ;   // ignore other characters

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Converting Decimal to Binary:\n\n");
    yylex();
    return 0;
}
