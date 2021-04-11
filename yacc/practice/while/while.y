%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
int yyerror(const char*s);
%}

%token WHILE AND OR RELOP INTEGER ID EOL
%right '='
%left AND OR
%left RELOP
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%
s: stmt EOL {printf("the while loop is valid!"); return 0;};
stmt: WHILE'('condn')''{'stmt1'}'
| WHILE'('condn')' stmt1
;
stmt1: exp
| stmt1 exp 
;
condn: exp RELOP exp
| exp AND exp
| exp OR exp
;
exp: ID '=' exp';'
| exp '+' exp
| exp '-' exp
| exp '*' exp
| exp '/' exp
| '(' exp ')'
| '-'ID
| '-'INTEGER
| ID
| INTEGER
;
%%

int main() {
    printf("enter the stmt to be checked: ");
    yyparse();
    exit(0); 
}
int yyerror(const char*s) {
    printf("the statement is not valid!\n%s", s);
    exit(0);
}