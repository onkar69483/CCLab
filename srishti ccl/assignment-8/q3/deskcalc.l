%{
#include <stdio.h>
#include <stdlib.h>

double result = 0;
char op = 0;
int first = 1;
%}

%%
[0-9]+(\.[0-9]+)?  {
                        if (first) {
                            result = atof(yytext);
                            first = 0;
                        } else {
                            double num = atof(yytext);
                            switch(op) {
                                case '+': result += num; break;
                                case '-': result -= num; break;
                                case '*': result *= num; break;
                                case '/': result /= num; break;
                                default: break;
                            }
                        }
                     }
[+\-*/]             { op = yytext[0]; }
\n                  { printf("Answer: %g\n", result); result = 0; op = 0; first = 1; }
[ \t]               ;  /* ignore spaces */
.                   ;  /* ignore any other characters */
%%

int main(void) {
    printf("Enter expression (simple operators only, end with Enter):\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
