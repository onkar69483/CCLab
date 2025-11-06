%{
#include <stdio.h>
#include <stdlib.h>

// helper function to convert decimal to binary
void decToBin(int num) {
    if (num == 0) {
        printf("0\n");
        return;
    }
    char bin[64];
    int i = 0;
    while (num > 0) {
        bin[i++] = (num % 2) + '0';
        num /= 2;
    }
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", bin[j]);
    }
    printf("\n");
}
%}

%%
[0-9]+   {
             int num = atoi(yytext);
             decToBin(num);
          }
[\n\t ]+  ;
.         { ECHO; }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }
