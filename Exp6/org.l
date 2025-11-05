%{
#include <stdio.h>
int count = 0;
%}

%%
(http|https)://[a-zA-Z0-9./_-]*org(/)?(\n| )    { count++; }  
.|\n                                             { /* ignore other text */ }
%%

int main()
{
    yylex();
    printf("Number of URLs ending with 'org' = %d\n", count);
    return 0;
}

int yywrap()
{
    return 1;
}
