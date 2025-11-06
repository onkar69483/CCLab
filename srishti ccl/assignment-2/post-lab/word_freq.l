%{
#include <stdio.h>
#include <string.h>

int count = 0;
char word[100]; // word to be searched

%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (strcmp(yytext, word) == 0)
        count++;
}
.|\n ; // Ignore other characters

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: ./word_freq <input_file>\n");
        return 1;
    }

    printf("Enter the word to count: ");
    scanf("%s", word);

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("File open error");
        return 1;
    }

    yylex();

    printf("Frequency of word '%s': %d\n", word, count);
    return 0;
}
