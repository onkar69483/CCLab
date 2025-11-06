%{
#include <stdio.h>
#include <ctype.h>

int count = 0;
%}

%%

a[a-zA-Z0-9_]*a([^a-zA-Z0-9_]|$)   { count++; }
[ \t\n]+                           ;     
.                                  ;      

%%

int main(int argc, char **argv) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    yylex();
    printf("Words starting and ending with 'a': %d\n", count);
    return 0;
}
