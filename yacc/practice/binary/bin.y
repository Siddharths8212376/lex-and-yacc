%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(const char*s);
%}
%union {
    int iVal;
    char sVal;
}
%token EOL
%token <iVal> ZERO ONE
%type <iVal> num l bin

%%
num : l EOL {printf("the value of the number is : %d", $$); return 0;};
l: l bin {$$ = 2 * $1 + $2;}
| bin {$$ = $1;}
;
bin: ZERO {$$ = $1-'0'; printf("zero with val: %d", $$);}
| ONE {$$ = $1-'0'; printf("one with val: %d", $$);}
;
%%

int main() {
    printf("enter the binary string: ");
    yyparse();
    exit(0);
}

int yyerror(const char*s) {
    printf("the string is not binary! %s\n", s);
    exit(0);
}
