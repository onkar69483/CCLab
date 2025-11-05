// LEX code for conversion of lowercase to uppercase and vice versa. 

%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[a-z]   { printf("%c", toupper(yytext[0])); }
[A-Z]   { printf("%c", tolower(yytext[0])); }
.|\n    { printf("%s", yytext); }
%%

int yywrap() {return 1;}

int main(){
    yylex();
    return 0;
}