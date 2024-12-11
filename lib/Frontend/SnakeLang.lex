%{
#define YYSTYPE void*
#define YYERROR_VERBOSE
#include "Parser.tab.hh"
extern "C" int yylex();
%}

%option yylineno
%option noyywrap

%%

[/][/].*\n       ; // comment
[0-9]*           {
#ifdef DEBUG
                   printf("IntLiteral %s\n", yytext);
#endif
                   yylval = strdup(yytext);
                   return IntLiteral;
                 }
"SsFun"          { 
#ifdef DEBUG
                   printf("FunctionBegin\n"); 
#endif
                   return FunctionBegin; }
"}"              { 
#ifdef DEBUG
                   printf("FunctionEnd\n"); 
#endif
                   return FunctionEnd; }
"SsCall"         { 
#ifdef DEBUG
                   printf("CallFunction\n"); 
#endif
                   return CallFunction; }
"SsIf"           { 
#ifdef DEBUG
                   printf("IfToken\n"); 
#endif
                   return IfToken; }
"SsCrawl"        { 
#ifdef DEBUG
                   printf("CrawlToken\n"); 
#endif
                   return CrawlToken; }
"SsPutPixel"     { 
#ifdef DEBUG
                   printf("PutToken\n"); 
#endif
                   return PutPixelToken; }
"SsCrOut"        { 
#ifdef DEBUG
                   printf("PrintToken\n"); 
#endif
                   return PrintToken; }
"SsUpdateScreen" { 
#ifdef DEBUG
                   printf("UpdateScreenToken\n"); 
#endif
                   return UpdateScreenToken; }
"__"             { 
#ifdef DEBUG
                   printf("EndlToken\n"); 
#endif
                   return EndlToken; }
[A-Za-z]+        { // variable 
                   
#ifdef DEBUG
                   printf("Identifier %s\n", yytext);
#endif
                   yylval = strdup(yytext);
                   return Identifier;
                 }
[ \t\r\n]        ; // whitespace
.                { return *yytext; }

%%
