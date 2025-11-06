%{
#include <stdio.h>
%}

%%
[A-Z]      { printf("Uppercase letter\n"); }
[a-z]      { printf("Lowercase letter\n"); }
[^A-Za-z]  { printf("Non-alphabetic character\n"); }
%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yylex();
    return 0;
}
