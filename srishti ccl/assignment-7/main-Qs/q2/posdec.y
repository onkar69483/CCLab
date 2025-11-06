%{
#include <stdio.h>
#include <stdlib.h>

// Function prototypes
int yylex(void);
int yyerror(char *s);
%}

%union {
    double fval;
}

%token <fval> NUMBER
%type  <fval> expr line   /* declare nonterminals to use fval */

%left '+' '-'
%left '*' '/'

%%
line    : expr '\n'   { printf("Result = %.2f\n", $1); }
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
