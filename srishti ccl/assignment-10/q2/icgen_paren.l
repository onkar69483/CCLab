%{
#include "y.tab.h"
%}

%%
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
[a-zA-Z]+   { yylval.str = strdup(yytext); return ID; }
[=+\-*/()]  { return yytext[0]; }
[\n\t ]+    ;
.           ;
%%

int yywrap() { return 1; }
