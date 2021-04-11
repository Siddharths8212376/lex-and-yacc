%{
#include<stdio.h>
#include<stdlib.h>
char line[100];
%}

%%
\/\/(.*)\n ;
"/*"(.|\n)*"*/" ;
\n {fprintf(yyout, "%s\n", line);}
(.*) {strcpy(line, yytext);}
<<EOF>> {fprintf(yyout, "%s\n", line); return 0;}
%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("cpy.txt", "r");
    yyout = fopen("hy.txt", "w");
    yylex();
    return 0;
}