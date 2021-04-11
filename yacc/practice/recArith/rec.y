%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(const char*s);
%}

%token ID INTEGER EOL
%left '+''-'
%left '*''/'

%%
stmt: exp EOL {printf("expression is validated!!"); return 0;};
exp: exp '+' exp
| exp '-' exp
| exp '*' exp
| exp '/' exp
| '('exp')'
| '-'ID
| '-'INTEGER
| ID
| INTEGER
;
%%

int main() {
    printf("enter the expression: ");
    yyparse();
    // printf("expression is valid!");
    exit(0);
}

int yyerror(const char*s) {
    printf("expression is invalid!");
    exit(0);
}