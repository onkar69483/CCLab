%{
#include <stdio.h>
int count = 0;
%}

%%
.*org\n   { count++; }
.|\n      ;
%%

int main() {
    yylex();
    printf("Number of lines ending with org = %d\n", count);
    return 0;
}

int yywrap() { return 1; }
