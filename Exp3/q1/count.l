// Implement a LEX program to count the number of words starting with ‘A’. 

%{
    #include <stdio.h>
    int count = 0;
%}

%%
[Aa][a-zA-Z]*   { count++; }
.|\n    ;
%%

int main(){
    yylex();
    printf("\nNumber: %d\n", count);
    return 0;
}

int yywrap() { return 1; }