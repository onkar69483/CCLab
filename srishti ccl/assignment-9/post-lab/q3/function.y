%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token TYPE RETURN LPAREN RPAREN LBRACE RBRACE SEMI COMMA ID NUM ASSIGN RELOP

%%
S : TYPE ID LPAREN PARAMS RPAREN LBRACE BODY RBRACE 
      { printf("Valid FUNCTION syntax\n"); }
  ;

PARAMS : PARAMS COMMA PARAM
       | PARAM
       | /* empty */
       ;

PARAM : TYPE ID ;

BODY : BODY STMT
     | STMT
     ;

STMT : ID ASSIGN NUM SEMI
     | RETURN ID SEMI
     ;
%%

void yyerror(const char *s) {
    printf("Invalid syntax: %s\n", s);
}

int main() {
    printf("Enter a function definition:\n");
    yyparse();
    return 0;
}
