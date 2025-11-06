%{
#include <stdio.h>
#include <string.h>

int count = 0;
char target[100];
%}

%%

[a-zA-Z0-9_]+ {
    if (strcmp(yytext, target) == 0)
        count++;
}

[ \t\n]+    ;  // Skip whitespace
.           ;  // Skip any other characters

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: ./word_freq <input_file>\n");
        return 1;
    }

    printf("Enter the word to count: ");
    scanf("%s", target);

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("File open error");
        return 1;
    }

    yylex();

    printf("Frequency of word '%s': %d\n", target, count);
    return 0;
}