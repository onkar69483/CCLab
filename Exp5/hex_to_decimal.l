%{
#include <stdio.h>
#include <stdlib.h>   // for strtol()
%}

%%

0[xX][0-9a-fA-F]+ {
    // Remove the "0x" or "0X" prefix and convert
    long int num = strtol(yytext, NULL, 16);
    printf("Hexadecimal: %s\tDecimal: %ld\n", yytext, num);
}

[0-9a-fA-F]+ {
    // If hex number given without 0x prefix
    long int num = strtol(yytext, NULL, 16);
    printf("Hexadecimal: %s\tDecimal: %ld\n", yytext, num);
}

[ \t\n]+    ;   // ignore whitespace
.           ;   // ignore non-hex characters

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Converting Hexadecimal to Decimal:\n\n");
    yylex();
    return 0;
}
