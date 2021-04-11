%{
#include<stdio.h>
#include<stdlib.h>
int isValid=0;
int yyerror(const char*);
int yylex();
%}

%token NUMBER EOL
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
EXP: E EOL {printf("\nres: %d\n", $$); return 0;}
E: E '+' E {printf("+"); $$=$1+$3;}
| E '-' E {printf("-");$$=$1-$3;}
| E '*' E {printf("*");$$=$1*$3;}
| E '/' E {printf("/");$$=$1/$3;}
| E '%' E {printf("%%");$$=$1%$3;}
| '('E')' {$$=$2;}
| NUMBER {printf("%d", $1); $$=$1;}
;
%%
int yyerror(const char*s) {
    printf("\ninvalid arithmetic expression!");
    isValid=1;
}
void main() {
    printf("enter the expression to calculate: ");
    yyparse();
}