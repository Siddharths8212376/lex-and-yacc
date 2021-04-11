%{
#include <stdio.h>
#include <string.h>
int patternA, patternB;
%}

%%
aa[ab]*bb { printf("%s match-a %d", yytext, patternA+1); patternA++;}
[01]*000[01]* {printf("%s match-b %d", yytext, patternB+1); patternB++;}
. ;
%%

int yywrap(void) { return 1; }

int main(void) {
	extern FILE* yyin;
	yyin = fopen("regex.txt", "r");
	yylex();
	printf("pattern A matched %d times\npattern B matched %d times\n", patternA, patternB);
	return 0;
}
