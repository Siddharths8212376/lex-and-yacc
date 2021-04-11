%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(const char*s);
%}

%token IF ELSE RELOP INTEGER ID EOL 


%right '='
%left AND OR
%left '>''<'RELOP
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'

%%
s: stmt EOL {printf("the if statement is valid!"); return 0;};
stmt: IF'('condition')''{'stmt1';''}' 
| IF'('condition')' stmt1';'
| IF'('condition')' stmt1';' ELSE stmt1';'
;
stmt1: stmt 
| exp
;
condition: exp RELOP exp
| exp AND exp
| exp OR exp
;
exp: ID '=' exp
| exp '+' exp
| exp '-' exp
| exp '*' exp
| exp '/' exp
| '-' ID
| '-' INTEGER
| ID
| INTEGER
;
%%

int main() {
    printf("enter the statement: ");
    yyparse();
    exit(0);
}

int yyerror(const char*s) {
    printf("the given statement is not a valid if statement!\n");
    exit(0);
}