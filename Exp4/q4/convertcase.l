// LEX code for case conversion of alphabets/alphanumeric term using file handling. 

%{
#include <stdio.h>
#include <ctype.h>

FILE *fin, *fout;
%}

%%

[a-z]   { fputc(toupper(yytext[0]), fout); }   // Convert lowercase → uppercase
[A-Z]   { fputc(tolower(yytext[0]), fout); }   // Convert uppercase → lowercase
.|\n    { fputc(yytext[0], fout); }            // Copy all other characters as-is

%%

int yywrap() { return 1; }

int main() {
    fin = fopen("input.txt", "r");
    if (!fin) {
        printf("Error: Cannot open input.txt\n");
        return 1;
    }

    fout = fopen("output.txt", "w");
    if (!fout) {
        printf("Error: Cannot open output.txt\n");
        fclose(fin);
        return 1;
    }

    // Redirect Lex input to file
    yyin = fin;
    yylex();

    fclose(fin);
    fclose(fout);

    printf("Case conversion completed.\nOutput written to output.txt\n");
    return 0;
}
