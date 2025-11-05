//Lex program counts the number of comments, keywords, identifiers, words, lines, and spaces from the input file. 

%{
#include <stdio.h>
#include <string.h>

int comment_count = 0, keyword_count = 0, id_count = 0;
int word_count = 0, line_count = 0, space_count = 0;

char *keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default",
    "do", "double", "else", "enum", "extern", "float", "for",
    "goto", "if", "int", "long", "register", "return", "short",
    "signed", "sizeof", "static", "struct", "switch", "typedef",
    "union", "unsigned", "void", "volatile", "while"
};

int isKeyword(char *word) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/"   { comment_count++; }   // Multi-line comment
"//".*                       { comment_count++; }   // Single-line comment
[ \t]+                       { space_count += yyleng; }  // Spaces and tabs
\n                           { line_count++; }      // New line
[a-zA-Z_][a-zA-Z0-9_]*       {
                                if (isKeyword(yytext))
                                    keyword_count++;
                                else
                                    id_count++;
                                word_count++;
                             }
.                            ;   // Ignore other characters
%%

int yywrap() { return 1; }

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *fp = fopen(argv[1], "r");
        if (!fp) {
            printf("Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = fp;
    }
    yylex();
    printf("\n===== Code Analysis Report =====\n");
    printf("Number of comments   : %d\n", comment_count);
    printf("Number of keywords   : %d\n", keyword_count);
    printf("Number of identifiers: %d\n", id_count);
    printf("Number of words      : %d\n", word_count);
    printf("Number of lines      : %d\n", line_count);
    printf("Number of spaces     : %d\n", space_count);
    printf("================================\n");
    return 0;
}