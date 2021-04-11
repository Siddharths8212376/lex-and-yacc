%{
#include "y.tab.h"
extern int yylval;
%}

%%
[ \t] ;
[\n] {return EOL;}
while {return WHILE;}
&& {return AND;}
"||" {return OR;}
>=|<=|>|<|== {return RELOP;}
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
[_a-zA-Z][_a-zA-Z0-9]* {return ID;}
. {return yytext[0];}
%%