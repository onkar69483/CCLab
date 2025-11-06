%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(char *s);
%}

%union {
    char *str;
}

%token <str> NUMBER
%left '+' '-'
%left '*' '/'

%type <str> expr line

%%
line    : expr '\n'   { printf("Postfix = %s\n", $1); free($1); }
        ;

expr    : expr '+' expr   { 
                            char *buf; 
                            asprintf(&buf, "%s %s +", $1, $3); 
                            free($1); free($3); 
                            $$ = buf; 
                          }
        | expr '-' expr   { 
                            char *buf; 
                            asprintf(&buf, "%s %s -", $1, $3); 
                            free($1); free($3); 
                            $$ = buf; 
                          }
        | expr '*' expr   { 
                            char *buf; 
                            asprintf(&buf, "%s %s *", $1, $3); 
                            free($1); free($3); 
                            $$ = buf; 
                          }
        | expr '/' expr   { 
                            char *buf; 
                            asprintf(&buf, "%s %s /", $1, $3); 
                            free($1); free($3); 
                            $$ = buf; 
                          }
        | '(' expr ')'    { $$ = $2; }
        | NUMBER          { $$ = $1; }
        ;
%%

int main(void) {
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}