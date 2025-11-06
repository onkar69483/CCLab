%{
#include "y.tab.h"
%}

%%
"int"                   { return TYPE; }
"float"                 { return TYPE; }
"void"                  { return TYPE; }
"return"                { return RETURN; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
";"                     { return SEMI; }
","                     { return COMMA; }
"="                     { return ASSIGN; }
"<="|">="|"=="|"!="|"<"|">"   { return RELOP; }
[0-9]+                  { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[ \t\n]                 ;    /* ignore whitespace */
.                       { return yytext[0]; }
%%

int yywrap(void) { return 1; }
