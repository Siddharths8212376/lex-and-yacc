%{
#include "y.tab.h"
extern int yylval;
%}

%%
[ \t] ;
[\n] {return EOL;}
if {return IF;}
else {return ELSE;}
">="|"<="|"=="|">"|"<"|"&&"|"||" {return RELOP;}
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
[_a-zA-Z][_a-zA-Z0-9]* {return ID;}
. {return yytext[0];}
%%
