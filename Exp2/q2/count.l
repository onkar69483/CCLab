//Lex Program to print the total characters, white spaces, tabs in the given input file. 

%{
#include <stdio.h>

int char_count = 0;
int space_count = 0;
int tab_count = 0;
%}

%%
" "        { space_count += yyleng; char_count += yyleng; }   // spaces
"\t"       { tab_count += yyleng; char_count += yyleng; }     // tabs
.          { char_count += yyleng; }                           // all other characters
\n         { char_count += yyleng; }                           // newline also a character
%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *fp = fopen(argv[1], "r");
        if (!fp) {
            printf("Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = fp;
    }

    yylex();

    printf("\n===== Character Analysis =====\n");
    printf("Total Characters : %d\n", char_count);
    printf("White Spaces     : %d\n", space_count);
    printf("Tabs             : %d\n", tab_count);
    printf("================================\n");

    return 0;
}
