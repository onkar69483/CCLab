// LEX code to check whether the given character is in upper case, or 
in lower case or non-alphabetic character. 

%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[A-Z]       { printf("%s is an uppercase letter\n", yytext); }
[a-z]       { printf("%s is a lowercase letter\n", yytext); }
.|\n        { printf("%s is a non-alphabetic character\n", yytext); }
%%

int yywrap() {return 1;}

int main(){
    yylex();
    return 0;
}