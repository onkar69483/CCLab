%{
#include <stdio.h>
int count = 0;
%}

%%
.*com\n        { count++; }     // Matches any line ending with 'com'
.*              { }              // Matches other lines (ignored)
%%

int main()
{
    yylex();
    printf("Number of lines ending with 'com' = %d\n", count);
    return 0;
}

int yywrap()
{
    return 1;
}
