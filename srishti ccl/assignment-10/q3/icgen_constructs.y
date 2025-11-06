%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);
void gen(char *op, char *arg1, char *arg2, char *res);
void genLabel(char *label);

int tempCount = 1;
int labelCount = 1;
%}

%union {
    char *str;
}

%token <str> ID NUM
%token IF ELSE WHILE
%left '+' '-'
%left '*' '/'
%left '<' '>' LE GE EQ NE
%left '(' ')'
%type <str> E C

%%

S : STMT
  | S STMT
  ;

STMT : ID '=' E ';' { gen("=", $3, "", $1); }
     | IF '(' C ')' '{' S '}' { 
            char label[10]; 
            sprintf(label, "L%d", labelCount++);
            printf("ifFalse %s goto %s\n", $3, label);
            printf("%s:\n", label);
       }
     | IF '(' C ')' '{' S '}' ELSE '{' S '}' {
            char l1[10], l2[10];
            sprintf(l1, "L%d", labelCount++);
            sprintf(l2, "L%d", labelCount++);
            printf("ifFalse %s goto %s\n", $3, l1);
            printf("goto %s\n", l2);
            printf("%s:\n", l1);
            printf("%s:\n", l2);
       }
     | WHILE '(' C ')' '{' S '}' {
            char l1[10], l2[10];
            sprintf(l1, "L%d", labelCount++);
            sprintf(l2, "L%d", labelCount++);
            printf("%s:\n", l1);
            printf("ifFalse %s goto %s\n", $3, l2);
            printf("goto %s\n", l1);
            printf("%s:\n", l2);
       }
     ;

C : E '<' E {
        char tempVar[10];
        sprintf(tempVar, "t%d", tempCount++);
        gen("<", $1, $3, tempVar);
        $$ = strdup(tempVar);
     }
  | E '>' E {
        char tempVar[10];
        sprintf(tempVar, "t%d", tempCount++);
        gen(">", $1, $3, tempVar);
        $$ = strdup(tempVar);
     }
  | E EQ E {
        char tempVar[10];
        sprintf(tempVar, "t%d", tempCount++);
        gen("==", $1, $3, tempVar);
        $$ = strdup(tempVar);
     }
  | E NE E {
        char tempVar[10];
        sprintf(tempVar, "t%d", tempCount++);
        gen("!=", $1, $3, tempVar);
        $$ = strdup(tempVar);
     }
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
  | '(' E ')' { $$ = strdup($2); }
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
    printf("Enter statements:\n");
    yyparse();
    return 0;
}
