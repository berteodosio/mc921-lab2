#include "token.h"
#include <stdio.h>
#include <stdlib.h>

extern int yylex();

extern int linesCount;

char *yytext;

int yyerror(char *s) {
    printf("ERROR yy\n");
    (void)s;
    return 0;
}


int main() {
    char format[] = "%s %s\n";
    enum token_id code;

    do {
        code = yylex();
        switch(code) {
            case T_ERROR:
                printf("T_ERROR line %d\n", linesCount);
                exit(1);
            default:
                printf("%s %s\n", token_name[code], yytext);
                break;
        }
    } while (code != T_EOF);
    printf("lines:%d\n", linesCount);
    return 0;
}
