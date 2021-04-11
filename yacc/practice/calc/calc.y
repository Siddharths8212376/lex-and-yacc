%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int yylex();
int yyerror(const char*s);
%}

%token INTEGER FLOAT EOL
%left '+''-'
%left '*''/'
%right '^'
%%
stmt: exp EOL {printf("the value is: %d",$$); return 0;};
exp: exp '+' exp {$$=$1+$3;}
| exp '-' exp {$$=$1-$3;}
| exp '*' exp {$$=$1*$3;}
| exp '/' exp {$$=$1/$3;}
| exp '^' exp {$$=(int)pow($1,$3);}
| '('exp')' {$$=$2;}
| '-'INTEGER {$$=-1*$2;}
| INTEGER {$$=$1;}
| '-'FLOAT {$$=-1*$2;}
| FLOAT {$$=$1;}
;
%%

int main() {
    printf("enter the expression: ");
    yyparse();
    exit(0);
}

int yyerror(const char*s) {
    printf("the expression is invalid!");
    exit(0);
}