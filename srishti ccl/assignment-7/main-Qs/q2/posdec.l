%{
#include "posdec.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?    { yylval.fval = atof(yytext); return NUMBER; }
[+\-*/]              { return *yytext; }
\n                   { return '\n'; }
[ \t]                ;
.                    { return yytext[0]; }
%%
