%{
#include <stdio.h>
int a_word_count = 0;
%}

%%

A[a-zA-Z0-9_]*     { a_word_count++; }
[ \t\n]+           ;     // skip whitespace
.                  ;     // skip other characters

%%

int main(int argc, char **argv) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    yylex();
    printf("Words starting with capital 'A': %d\n", a_word_count);
    return 0;
}
