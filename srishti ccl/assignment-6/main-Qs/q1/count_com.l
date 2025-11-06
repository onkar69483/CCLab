%{
#include <stdio.h>
int count = 0;
%}

%%
.*com\n   { count++; }
.|\n      ;
%%

int main() {
    yylex();
    printf("Number of lines ending with com = %d\n", count);
    return 0;
}
int yywrap() { return 1; }
