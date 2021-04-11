%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(const char*s);
%}

%token INTEGER ID
%left '+''-'
%left '*''/'
%%
exp: exp'+'exp
   |exp'-'exp
|exp'*'exp
|exp'/'exp
|'-'INTEGER
|'-'ID
|'('exp')'
|INTEGER
|ID
;
%%

int main() {
	printf("enter the expression\n");
	yyparse();
	printf("\nexpression is valid.");
	exit(0);
}
int yyerror(const char*s) {
	printf("\nexpression is invalid!");
	exit(0);
}
