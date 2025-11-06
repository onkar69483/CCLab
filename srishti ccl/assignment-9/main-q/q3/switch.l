%{
#include "y.tab.h"
%}

%%
"switch"                { return SWITCH; }
"case"                  { return CASE; }
"default"               { return DEFAULT; }
"break"                 { return BREAK; }
":"                     { return COLON; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
";"                     { return SEMI; }
[0-9]+                  { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[ \t\n]                 ;   /* ignore whitespace */
.                       { return yytext[0]; }
%%

int yywrap(void) { return 1; }
