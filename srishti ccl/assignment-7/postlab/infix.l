%{
#include "infix.tab.h"
#include <string.h>
%}

%%

[0-9]+          { yylval.str = strdup(yytext); return NUMBER; }
[+\-*/()]       { return yytext[0]; }
[ \t]           ;                /* ignore spaces and tabs */
\n              { return '\n'; } /* return newline to parser */
.               { return yytext[0]; }

%%
