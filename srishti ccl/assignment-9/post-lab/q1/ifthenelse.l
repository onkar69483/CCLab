%{
#include "y.tab.h"
%}

%%
"if"                    { return IF; }
"then"                  { return THEN; }
"else"                  { return ELSE; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
";"                     { return SEMI; }
"<="|">="|"=="|"!="|"<"|">"   { return RELOP; }
"="                     { return ASSIGN; }
[0-9]+                  { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[ \t\n]                 ;    /* ignore whitespace */
.                       { return yytext[0]; }
%%

int yywrap(void) { return 1; }
