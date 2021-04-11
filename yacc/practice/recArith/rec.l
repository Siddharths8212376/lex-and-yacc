%{
    #include "y.tab.h"
    extern int yylval;
%}

%%
[0-9]* {yylval = atoi(yytext); return INTEGER; }
[_a-zA-Z][_a-zA-Z0-9]* {return ID; }
\t ;
\n { return EOL; }
. {return yytext[0]; }
%%