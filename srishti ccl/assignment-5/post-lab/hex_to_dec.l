%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9A-Fa-f]+   {
                   int num = (int)strtol(yytext, NULL, 16);
                   printf("%d\n", num);
               }
[\n\t ]+        ;
.               { ECHO; }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }
