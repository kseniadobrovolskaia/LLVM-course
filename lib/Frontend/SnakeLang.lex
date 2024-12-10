%{
#define YYSTYPE void*
#define YYERROR_VERBOSE
#include "SnakeLang.tab.h"
extern "C" int yylex();
%}

%option yylineno
%option noyywrap

%%

[/][/].*\n       ; // comment
[0-9]*           {
                   printf("IntLiteral %s\n", yytext);
                   yylval = strdup(yytext);
                   return IntLiteral;
                 }
"SsFun"          { printf("FunctionBegin\n"); return FunctionBegin; }
"}"              { printf("FunctionEnd\n"); return FunctionEnd; }
"SsCall"         { printf("CallFunction\n"); return CallFunction; }
"SsIf"           { printf("IfToken\n"); return IfToken; }
"SsCrawl"        { printf("CrawlToken\n"); return CrawlToken; }
"SsPutPixel"     { printf("PutToken\n"); return PutPixelToken; }
"SsUpdateScreen" { printf("UpdateScreenToken\n"); return UpdateScreenToken; }
"__"             { printf("EndlToken\n"); return EndlToken; }
[A-Za-z]+        { // identifier or array
                   printf("Identifier %s\n", yytext);
                   yylval = strdup(yytext);
                   return Identifier;
                 }
[ \t\r\n]        ;  // whitespace
.                { return *yytext; }

%%
