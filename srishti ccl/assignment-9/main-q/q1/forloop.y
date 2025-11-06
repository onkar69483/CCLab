%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token FOR LPAREN RPAREN SEMI ID NUM RELOP ASSIGN OP

%%
S : FOR LPAREN E SEMI C SEMI INC RPAREN { printf("Valid FOR loop syntax\n"); }
  ;

E : ID ASSIGN NUM ;

C : ID RELOP NUM ;

INC : ID ASSIGN ID OP NUM ;
%%

void yyerror(const char *s) {
    printf("Invalid syntax: %s\n", s);
}

int main() {
    printf("Enter a FOR loop:\n");
    yyparse();
    return 0;
}
