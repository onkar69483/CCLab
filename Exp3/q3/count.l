//  Implement a LEX program for finding frequency of a particular word in the input file. 

%{
#include <stdio.h>
#include <string.h>

char target[100];
int count = 0;
%}

%%
[a-zA-Z]+   {
                if(strcmp(yytext, target) == 0)
                    count++;
            }

.|\n        ;   // ignore other characters
%%

int yywrap() { return 1; }

int main() {
    printf("Enter word to be counted: ");
    scanf("%s", target);
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    printf("\nWord Count of '%s': %d\n", target, count);
    return 0;
}
