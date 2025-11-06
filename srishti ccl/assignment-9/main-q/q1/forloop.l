%{
#include "y.tab.h"
%}

%%
"for"                    { return FOR; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }
";"                      { return SEMI; }
[0-9]+                   { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }
"<="|">="|"=="|"!="|"<"|">"   { return RELOP; }
"="                      { return ASSIGN; }
"+"|"-"|"*"|"/"          { return OP; }
[ \t\n]                  ;    /* ignore spaces */
.                        { return yytext[0]; }
%%

int yywrap(void) { return 1; }
