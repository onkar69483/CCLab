%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);
void gen(char *op, char *arg1, char *arg2, char *res);

int tempCount = 1;
%}

%union {
    char *str;
}

%token <str> ID NUM
%left '+' '-'
%left '*' '/'
%type <str> E

%%

S : ID '=' E { gen("=", $3, "", $1); }
  ;

E : E '+' E { 
        char tempVar[10]; 
        sprintf(tempVar, "t%d", tempCount++); 
        gen("+", $1, $3, tempVar); 
        $$ = strdup(tempVar); 
    }
  | E '-' E { 
        char tempVar[10]; 
        sprintf(tempVar, "t%d", tempCount++); 
        gen("-", $1, $3, tempVar); 
        $$ = strdup(tempVar); 
    }
  | E '*' E { 
        char tempVar[10]; 
        sprintf(tempVar, "t%d", tempCount++); 
        gen("*", $1, $3, tempVar); 
        $$ = strdup(tempVar); 
    }
  | E '/' E { 
        char tempVar[10]; 
        sprintf(tempVar, "t%d", tempCount++); 
        gen("/", $1, $3, tempVar); 
        $$ = strdup(tempVar); 
    }
  | ID  { $$ = strdup($1); }
  | NUM { $$ = strdup($1); }
  ;

%%

void gen(char *op, char *arg1, char *arg2, char *res)
{
    if (strcmp(op, "=") == 0)
        printf("%s = %s\n", res, arg1);
    else
        printf("%s = %s %s %s\n", res, arg1, op, arg2);
}

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}
int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}
