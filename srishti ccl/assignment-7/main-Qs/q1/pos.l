%{
#include "pos.tab.h"
%}

%%
[0-9]+   { yylval = atoi(yytext); return NUMBER; }
[+\-*/]  { return *yytext; }
\n       { return '\n'; }
[ \t]    ;
.        { return yytext[0]; }
%%
