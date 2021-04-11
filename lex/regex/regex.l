%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    int patternA, patternB;
%}

%%
aa[ab]*bb {printf("pattern a %s matched", yytext); patternA++;} 
[01]*000[01]* {printf("pattern b %s matched", yytext); patternB++;}
. ;
%%

int yywrap() {return 1;}

int main() {
    // printf("enter the input expressions: ");
    extern FILE* yyin;
    yyin = fopen("regex.txt", "r");
    yylex();
    printf("\npatternA: %d\npatternB: %d\n", patternA, patternB);
}