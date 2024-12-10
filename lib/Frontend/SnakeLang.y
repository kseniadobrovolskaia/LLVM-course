%{
#include <iostream>
#include "GraphicalApp.h"
#include "Lexems.h"

#define YYSTYPE Value*

void yyerror(char *s) {
    std::cerr << s << "\n";
}
int yywrap(void){return 1;}

extern LLVMContext context;
extern IRBuilder<>* builder;
extern Module* module;
extern Function *curFunc;
extern FunctionCallee updateScreenFunc;
extern FunctionCallee putPixelFunc;

extern std::map<std::string, value_t> ValueMap;
extern std::map<std::string, BasicBlock *> BBMap;
%}

%token IntLiteral
%token FunctionBegin
%token FunctionEnd
%token CallFunction
%token Identifier
%token IfToken
%token CrawlToken
%token PutPixelToken
%token UpdateScreenToken
%token EndlToken

%%

Parse: Program {YYACCEPT;}

Program: RoutineDeclaration {}
         | Assignment {}
         | Program RoutineDeclaration {}
         | Program Assignment {}

RoutineDeclaration : FunctionBegin Identifier '{'  {
                            printf("FunctionBegin Identifier ...\n");
                            // declare void @Identifier()
                            Function *func = module->getFunction((char*)$2);
                            if (func == nullptr) {
                                FunctionType *funcType = 
                                                        FunctionType::get(builder->getVoidTy(), false);
                                func = Function::Create(funcType, Function::ExternalLinkage, (char*)$2, module);
                            }
                            curFunc = func;
                            // entry:
                            BasicBlock *entryBB = BasicBlock::Create(context, "entry", curFunc);
                            builder->SetInsertPoint(entryBB);
                        } Statements FunctionEnd { 
                            printf("... Statements FunctionEnd\n");
                            builder->CreateRetVoid();
                        }

Statements: Assignment {printf("Assignment\n");}
            | Crawl  {}
            | IfStatement {}
            | PutPixel  {}
            | UpdateScreen {}
            | RoutineCall {}
            | Statements Assignment {printf("Statements Assignment\n");}
            | Statements RoutineCall {printf("Statements RoutineCall\n");}
            | Statements IfStatement {printf("Statements IfStatement\n");}
            | Statements Label {printf("Statements Label\n");}
            | Statements Crawl {printf("Statements Crawl\n");}
            | Statements PutPixel {printf("Statements PutPixel\n");}
            | Statements UpdateScreen {printf("Statements UpdateScreen\n");}

PutPixel : PutPixelToken '('Expression','Expression','Expression')' EndlToken {
                            Value *args[] = {$3, $5, $7};
                            builder->CreateCall(putPixelFunc, args);
                        }

UpdateScreen : UpdateScreenToken EndlToken { builder->CreateCall(updateScreenFunc); }

Assignment: Value '=' Expression EndlToken { printf("Value '=' Expression EndlToken\n"); builder->CreateStore($3, $1); }

RoutineCall: CallFunction Identifier EndlToken {
                            Function *func = module->getFunction((char*)$2);
                            if (func == nullptr) {
                                FunctionType *funcType = 
                                                        FunctionType::get(builder->getVoidTy(), false);
                                func = Function::Create(funcType, Function::ExternalLinkage, (char*)$2, module);
                            }
                            builder->CreateCall(func);
                        }

IfStatement: IfToken '('Expression')' ':' Identifier EndlToken Identifier ':' {
                            if (BBMap.find((char*)$8) == BBMap.end()) {
                                BBMap.insert({(char*)$8, BasicBlock::Create(context, (char*)$8, curFunc)});
                            }
                            if (BBMap.find((char*)$6) == BBMap.end()) {
                                BBMap.insert({(char*)$6, BasicBlock::Create(context, (char*)$6, curFunc)});
                            }
                            Value *cond = builder->CreateICmpNE($3, builder->getInt32(0));
                            builder->CreateCondBr(cond, BBMap[(char*)$8], BBMap[(char*)$6]);
                            BasicBlock *BB = BBMap[(char*)$8];
                            builder->SetInsertPoint(BB);
                        }

Label:  Identifier ':'   {
                            if (BBMap.find((char*)$1) == BBMap.end()) {
                                BBMap.insert({(char*)$1, BasicBlock::Create(context, (char*)$1, curFunc)});
                            }
                            BasicBlock *BB = BBMap[(char*)$1];
                            builder->SetInsertPoint(BB);
                        }

Crawl:  CrawlToken Identifier EndlToken {
                            if (BBMap.find((char*)$2) == BBMap.end()) {
                                BBMap.insert({(char*)$2, BasicBlock::Create(context, (char*)$2, curFunc)});
                            }
                            BasicBlock *BB = BBMap[(char*)$2];
                            builder->CreateBr(BB);
                        }

Expression: Simple
            | Expression '!''=' Simple { $$ = builder->CreateZExt(builder->CreateICmpNE($1, $4), builder->getInt32Ty()); }
            | Expression '=''=' Simple { $$ = builder->CreateZExt(builder->CreateICmpEQ($1, $4), builder->getInt32Ty()); }
            | Expression '<'    Simple { $$ = builder->CreateZExt(builder->CreateICmpSLT($1, $3), builder->getInt32Ty()); }
            | Expression '<''=' Simple { $$ = builder->CreateZExt(builder->CreateICmpSLE($1, $4), builder->getInt32Ty()); }
            | Expression '>'    Simple { $$ = builder->CreateZExt(builder->CreateICmpSGT($1, $3), builder->getInt32Ty()); }
            | Expression '>''=' Simple { $$ = builder->CreateZExt(builder->CreateICmpSGE($1, $4), builder->getInt32Ty()); }
;
Simple:     Summand
            | Simple '+' Summand { $$ = builder->CreateAdd($1, $3); }
            | Simple '-' Summand { $$ = builder->CreateSub($1, $3); }

Summand:    Factor
            | Summand '*' Factor  { $$ = builder->CreateMul($1, $3); }
            | Summand '/' Factor  { $$ = builder->CreateSDiv($1, $3); }
            | Summand '%' Factor  { $$ = builder->CreateSRem($1, $3); }
;

Factor:     Primary { $$ = $1; }
            | '-' Primary { $$ = builder->CreateNeg($2); }
            | '(' Expression ')' { $$ =$2; }
;

Primary:    IntLiteral { $$ = builder->getInt32(atoi((char*)$1)); }
            | Value { $$ = builder->CreateLoad(builder->getInt32Ty(), $1); }
;

Value:      Identifier  {
                            if (ValueMap.find((char*)$1) == ValueMap.end()) {
                              printf("Declaration\n");
                              module->getOrInsertGlobal((char*)$1, builder->getInt32Ty());
                              value_t val;
                              val.irVal = module->getNamedGlobal((char*)$1);
                              val.realVal = 100500;
                              ValueMap.insert({(char*)$1, val});
                            } else
                              printf("Usage\n");
                            $$ = builder->CreateConstGEP1_32(builder->getInt32Ty(), ValueMap[(char*)$1].irVal, 0);
                        }
%%
