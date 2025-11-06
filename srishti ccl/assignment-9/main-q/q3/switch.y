%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token SWITCH CASE DEFAULT BREAK COLON LBRACE RBRACE LPAREN RPAREN SEMI ID NUM

%%
S : SWITCH LPAREN ID RPAREN LBRACE CASES DEFAULT_CASE RBRACE 
    { printf("Valid SWITCH case syntax\n"); }
  ;

CASES : CASES CASE_BLOCK
      | CASE_BLOCK
      ;

CASE_BLOCK : CASE NUM COLON STMT BREAK SEMI
           ;

DEFAULT_CASE : DEFAULT COLON STMT
             ;

STMT : ID '=' NUM SEMI
     | /* empty */
     ;
%%

void yyerror(const char *s) {
    printf("Invalid syntax: %s\n", s);
}

int main() {
    printf("Enter a SWITCH statement:\n");
    yyparse();
    return 0;
}
