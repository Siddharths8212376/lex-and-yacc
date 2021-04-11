%{
#include<stdio.h>
#include<string.h>
int countVowels, countWordsWithVowels, vowelsL, vowelsU;
%}

%%
[a-zA-Z]*[aeiouAEIOU][a-zA-Z]* {countWordsWithVowels++; char *str = yytext; for (int i = 0; i < strlen(str); i++) {
		if (str[i]=='a'||str[i]=='e'||str[i]=='i'||str[i]=='o'||str[i]=='u') {vowelsL++; countVowels++;}
		else if(str[i]=='A'||str[i]=='E'||str[i]=='I'||str[i]=='O'||str[i]=='U') {vowelsU++; countVowels++;}}}
\n {return 0;}
. ;
%%

int yywrap() {return 1;}

int main() {
	yylex();
	printf("number of vowels: %d\nnum lower: %d\nnum upper: %d\nnum words with vowels: %d", countVowels, vowelsL, vowelsU, countWordsWithVowels);
	return 0;
}
