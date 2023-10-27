%{
#include <stdio.h>
int line =1;
%}

%%
public          			{ printf("PUBLIC_SYMBOL\n"); }
class           			{ printf("CLASS_SYMBOL\n"); }
static           			{ printf("STATIC_SYMBOL\n"); }
void	           			{ printf("VOID_SYMBOL\n"); }
int		           			{ printf("INT_SYMBOL\n"); }
[a-zA-Z][a-zA-Z0-9]*  { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+  							{ printf("INTCONST: %s\n", yytext); }
\".*\"  							{ printf("STRINGCONST: %s\n", yytext); }
\{ 										{printf("LEFT_BRACE\n");}
\( 										{printf("LEFT_PARENTHESIS\n");}
\[ 										{printf("LEFT_BRACKET\n");}
\] 										{printf("RIGHT_BRACKET\n");}
\) 										{printf("RIGHT_PARENTHESIS\n");}
\} 										{printf("RIGHT_BRACE\n");}
\; 										{printf("SEMICOLON\n");}
\= 										{printf("EQUALS\n");}
\. 										{printf("DOT\n");}
\+ 										{printf("PLUS\n");}
\* 										{printf("STAR\n");}
\n										{line++;printf("LINE %d\n",line);}
. 										{}
%%

void set_input_string(char* input_str) {
  YY_BUFFER_STATE buffer = yy_scan_string(input_str);
  yy_switch_to_buffer(buffer);
}

void print_l(char* input) {
	set_input_string(input);
  yylex();
	fflush(stdout);
	yylex_destroy();
}
