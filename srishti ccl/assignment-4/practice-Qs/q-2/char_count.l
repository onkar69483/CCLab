%{
#include <stdio.h>
int upper = 0, lower = 0;
%}

%%
[A-Z]      { upper++; }
[a-z]      { lower++; }
.          { /* ignore other characters */ }
%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yylex();
    printf("Uppercase letters: %d\n", upper);
    printf("Lowercase letters: %d\n", lower);
    return 0;
}
