%{
#include "y.tab.h"
%}

%%
"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"=="        { return EQ; }
"!="        { return NE; }
"<="        { return LE; }
">="        { return GE; }
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
[a-zA-Z]+   { yylval.str = strdup(yytext); return ID; }
[=+\-*/<>(){};]  { return yytext[0]; }
[\n\t ]+    ;
.           ;
%%

int yywrap() { return 1; }
