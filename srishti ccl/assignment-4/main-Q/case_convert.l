%{
#include <stdio.h>
#include <ctype.h>
%}

%%

[a-z]     { putchar(toupper((unsigned char)yytext[0])); }
[A-Z]     { putchar(tolower((unsigned char)yytext[0])); }
.|\n      { putchar(yytext[0]); }

%%

int main(void) {
    printf("Enter text (Ctrl-D to finish): ");
    fflush(stdout);
    yylex();
    return 0;
}

int yywrap(void) { return 1; }
