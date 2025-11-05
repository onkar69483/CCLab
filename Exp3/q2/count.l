// Implement a LEX program for words beginning and ending with ‘a’.

%{
#include <stdio.h>
int count = 0;
%}

%%

[Aa][a-zA-Z]*[Aa]    { count++; }     // Word starts and ends with 'A' or 'a'
.|\n                 ;                // Ignore everything else

%%

int yywrap() { return 1; }

int main() {
    printf("Enter text (Ctrl+D to end input):\n");
    yylex();
    printf("\nNumber of words beginning and ending with 'A' or 'a' = %d\n", count);
    return 0;
}
