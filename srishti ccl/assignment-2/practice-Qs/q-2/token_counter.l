%{
#include <stdio.h>
int token_count = 0;
%}

%%

[ \t\n]+         ;                         // Ignore whitespace
[0-9]+           { token_count++; }        // Numbers
[a-zA-Z_][a-zA-Z0-9_]*  { token_count++; }  // Identifiers / keywords
"=="|"!="|"<="|">="|"<"|">"|"="|"+"|"-"|"*"|"/" { token_count++; } // Operators
"(" | ")" | "{" | "}" | ";" | "," { token_count++; } // Symbols
.                { token_count++; }        // Catch-all for any other token

%%

int main(int argc, char **argv) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    yylex();
    printf("Total tokens: %d\n", token_count);
    return 0;
}
