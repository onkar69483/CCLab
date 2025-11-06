%{
#include <stdio.h>
int comments = 0, keywords = 0, identifiers = 0, words = 0, lines = 0, spaces = 0;

char *keywords_list[] = {
    "if", "else", "while", "for", "return", "int", "float", "char", "double", "void", "break", "continue"
};
int is_keyword(char *word) {
    for (int i = 0; i < sizeof(keywords_list)/sizeof(char*); i++) {
        if (strcmp(word, keywords_list[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

"//".*                 { comments++; }
"/*"([^*]|\*+[^*/])*\*+"/"   { comments++; }
[a-zA-Z_][a-zA-Z0-9_]* {
    if (is_keyword(yytext))
        keywords++;
    else
        identifiers++;
    words++;
}
[ \t]+                { spaces += yyleng; }
\n                    { lines++; }
.                     { }

%%

int main(int argc, char **argv) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    yylex();
    printf("Comments: %d\n", comments);
    printf("Keywords: %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Words: %d\n", words);
    printf("Lines: %d\n", lines);
    printf("Spaces: %d\n", spaces);
    return 0;
}