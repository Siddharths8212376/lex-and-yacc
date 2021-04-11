%{
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%
[0] {yylval.iVal=0; yylval.sVal='0'; return ZERO;}
[1] {yylval.iVal=1; yylval.sVal='1'; return ONE;}
. ;
\n {return EOL;};
%%