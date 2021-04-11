%{
    #include<stdio.h>
    #include<stdlib.h>

%}

%%
^[0-9]* {printf("%s is a digit\n", yytext);}
^[^0-9]|[0-9]*[a-zA-Z] {printf("%s is not a digit\n", yytext);}
%%
int main() {
    yylex();
    return 0;
}