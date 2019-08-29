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

    int count = 0;
    // yyin  =3;
    // printf("%d\n", );

    do {
        code = yylex();
        // printf("POTATO: %s\n", token_name[code]);
        switch(code) {
            case T_ID:
                /* FALLTROUGH */
            case T_NUM:
                printf("%s %s\n", token_name[code], yytext);
                break;
            case T_ERROR:
                printf("T_ERROR\n");
                exit(1);
            default:
                printf("%s\n", token_name[code]);
                break;
        }
        count++;
    } while (code != T_EOF);
    printf("lines:%d\n", linesCount);
    return 0;
}
