%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
[0-9]*[.][0-9]* {yylval=atoi(yytext); return FLOAT;}
\t ;
\n {return EOL;}
. {return yytext[0];}
%%