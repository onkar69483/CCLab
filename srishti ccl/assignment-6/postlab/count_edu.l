%{
#include <stdio.h>
int count = 0;
%}

%%
.*edu\n   { count++; }
.|\n      ;
%%

int main() {
    yylex();
    printf("Number of lines ending with edu = %d\n", count);
    return 0;
}

int yywrap() { return 1; }
