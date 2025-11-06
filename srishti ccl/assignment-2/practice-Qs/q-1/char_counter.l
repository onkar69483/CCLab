%{
#include <stdio.h>

int total_chars = 0;
int whitespace_count = 0;
int tab_count = 0;
%}

%%

[\t]        { tab_count++; total_chars++; }
[ ]         { whitespace_count++; total_chars++; }
.           { total_chars++; }
\n          { total_chars++; }

%%

int main(int argc, char **argv) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    yylex();
    printf("Total Characters: %d\n", total_chars);
    printf("Whitespaces (spaces only): %d\n", whitespace_count);
    printf("Tabs: %d\n", tab_count);
    return 0;
}
