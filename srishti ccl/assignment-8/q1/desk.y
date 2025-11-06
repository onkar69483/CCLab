%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    double dval;
}

%token <dval> NUMBER
%type <dval> expr

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'   { printf("Answer: %g\n", $1); }
    | error '\n'  { yyerror("Invalid expression. Try again."); yyerrok; }
    ;

expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    ;

%%

int main(void) {
    printf("Enter the expression:\n");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
