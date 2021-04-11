%{
#include<stdio.h>
#include<string.h>
int cstmt, id, assmt, reln, key, integers;
%}

%%
int|auto|float|string|return {key++;}
>=|<=|>|<|== {reln++;}
[;] {cstmt++;}
[_a-zA-Z][_a-zA-Z0-9]+ {id++;}
[=] {assmt++;}
[0-9]+ {integers++;}
. ;
\n ;
%%
int yywrap() {return 1;}
int main() {
    extern FILE* yyin;
    yyin = fopen("hello.c", "r");
    yylex();
    printf("c-stmts: %d\nids: %d\nassmt: %d\nreln: %d\nkey: %d\nintegers: %d\n", cstmt,id, assmt, reln, key, integers);
    return 0;
}