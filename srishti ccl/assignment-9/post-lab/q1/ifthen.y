%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token IF THEN LPAREN RPAREN ID NUM RELOP ASSIGN SEMI

%%
S : IF LPAREN C RPAREN THEN STMT { printf("Valid IF-THEN syntax\n"); }
  ;

C : ID RELOP NUM
  ;

STMT : ID ASSIGN NUM SEMI
     ;
%%

void yyerror(const char *s) {
    printf("Invalid syntax: %s\n", s);
}

int main() {
    printf("Enter an IF-THEN statement:\n");
    yyparse();
    return 0;
}
