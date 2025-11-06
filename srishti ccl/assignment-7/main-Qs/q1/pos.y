%{
#include <stdio.h>
#include <stdlib.h>

// Function prototypes so clang doesn’t complain
int yylex(void);
int yyerror(char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
line    : expr '\n'   { printf("Result = %d\n", $1); }
        ;

expr    : expr expr '+'   { $$ = $1 + $2; }
        | expr expr '-'   { $$ = $1 - $2; }
        | expr expr '*'   { $$ = $1 * $2; }
        | expr expr '/'   { $$ = $1 / $2; }
        | NUMBER
        ;
%%

int main(void) {
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
