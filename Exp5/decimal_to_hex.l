// Decimal to Hexadecimal

%{
#include <stdio.h>
#include <stdlib.h>   // for atoi()
%}

%%

[0-9]+ {
    int num = atoi(yytext);     // convert string to integer
    printf("Decimal: %s\tHexadecimal: %X\n", yytext, num);
}

[ \t\n]+    ;   // ignore whitespace

.   ;       // ignore any other characters

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Converting Decimal to Hexadecimal:\n\n");
    yylex();
    return 0;
}
