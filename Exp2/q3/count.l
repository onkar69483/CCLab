// Lex code to count the total number of tokens. 

%{
    #include <stdio.h>
    #include <string.h>

    int token_count = 0;
%}

%%
"int"|"float"|"double"|"char"|"if"|"else"|"switch"|"for"|"while"|"do"|"return"  { token_count++; } //keywords
[a-zA-Z_][a-zA-Z0-9_]*  { token_count++; } //identifiers
[(){}\[\];:,]   { token_count++; } //special symbols
[0-9]+  { token_count++; } //numbers
"++"|"--"|"+="|"-="|"=="|"!="|">="|"<="|">"|"<"|"="|"+"|"-"|"*"|"/"|"%"   { token_count++; }
"//".*      ; //ignore single line comments
"/*"([^*]|\*+[^*/])*\*+"/"  ; //ignore multi line comments
[ \t\n]+    ; //ignore
.           ; //ignore any other character
%%

int yywrap() { return 1; }

int main(int argc, char *argv[]){
    if(argc > 1){
        FILE *fp = fopen(argv[1], "r");
        if(!fp){
            printf("\nFile not found: %s\n", argv[1]);
            return 1;
        }
        yyin = fp;
    }
    yylex();
    printf("\nTotal tokens: %d\n", token_count);
    return 0;
}