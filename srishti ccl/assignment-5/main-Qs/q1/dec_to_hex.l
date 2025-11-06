%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+   {
             int num = atoi(yytext);
             printf("%X\n", num);
          }
[\n\t ]+  ;
.         { ECHO; }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }
