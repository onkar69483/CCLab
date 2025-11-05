%{
#include <stdio.h>
int count = 0;
%}

%%
(http|https)://[a-zA-Z0-9./_-]*edu(/)?(\n| )    { count++; }  
.|\n                                             { /* ignore all other text */ }
%%

int main()
{
    yylex();
    printf("Number of URLs ending with 'edu' = %d\n", count);
    return 0;
}

int yywrap()
{
    return 1;
}
