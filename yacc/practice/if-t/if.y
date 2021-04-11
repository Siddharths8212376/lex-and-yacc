%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(const char*s);
%}
%token ID NUM IF RELOP ELSE EOL
%right '='
%left AND OR
%left '<' '>' RELOP
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%

S      : ST EOL {printf("Input accepted.\n");exit(0);};
ST    : IF '(' E2 ')' ST1';'
        | IF '(' E2 ')' ST1';' ELSE ST1';'
        ;
ST1  : ST
        | E
        ;
E    : ID'='E
      | E'+'E
      | E'-'E
      | E'*'E
      | E'/'E
      | E'<'E
      | E'>'E
      | E RELOP E
      | ID
      | NUM
      ;
E2  : E'<'E
      | E'>'E
      | E RELOP E
      | '('E')' RELOP E
      | E RELOP '('E')'
      | '('E')' RELOP '('E')'
      | ID
      | NUM
      ;
%%


int yyerror(const char*s) {
    printf("Error.. Invalid if statement\n");
    exit(0);
}
int main()
{
  printf("Enter the exp: ");
  yyparse();
  return 0;
}
