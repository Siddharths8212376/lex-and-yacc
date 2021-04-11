%{
#include "y.tab.h"
extern int yylval;
%}
alpha [A-Za-z_]
digit [0-9]
%%
[ \t]
[\n] return EOL;   
if    return IF;
else    return ELSE;
{digit}+    return NUM;
{alpha}({alpha}|{digit})*    return ID;
"<="|">="|"=="|"!="|"||"|"&&" return RELOP;
.    return yytext[0];
%%
