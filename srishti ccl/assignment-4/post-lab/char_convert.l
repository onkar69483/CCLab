%{
#include <stdio.h>
#include <ctype.h>
FILE *yyin, *yyout;
%}

%%
[A-Z]   { fputc(tolower(*yytext), yyout); }
[a-z]   { fputc(toupper(*yytext), yyout); }
.|\n    { fputc(*yytext, yyout); }
%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc != 3) return 1;
    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");
    yylex();
    fclose(yyin); fclose(yyout);
}
