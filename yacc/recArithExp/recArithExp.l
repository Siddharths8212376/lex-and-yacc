%{
#include "y.tab.h"
extern int yylval;
%}

%% 
[0-9]+ {yylval=atoi(yytext); return INTEGER; }
[a-zA-Z]+ {return ID;}
[\t]+ ;
\n {return 0;}
. {return yytext[0];}
%%


