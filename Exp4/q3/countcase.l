// LEX code to count the lowercase, upper case characters in the given input file.

%{
#include <stdio.h>
#include <ctype.h>
int l_count = 0, u_count;
%}

%%
[A-Z]       { l_count++; }
[a-z]       { u_count++; }
.|\n        ;
%%

int yywrap() {return 1;}

int main(){
    yylex();
    printf("\nLower count: %d", l_count);
    printf("\nUpper count: %d", u_count);
    return 0;
}