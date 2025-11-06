%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token WHILE LPAREN RPAREN SEMI ID NUM RELOP

%%
S : WHILE LPAREN C RPAREN SEMI { printf("Valid WHILE loop syntax\n"); }
  ;

C : ID RELOP NUM
  ;
%%

void yyerror(const char *s) {
    printf("Invalid syntax: %s\n", s);
}

int main() {
    printf("Enter a WHILE loop:\n");
    yyparse();
    return 0;
}
