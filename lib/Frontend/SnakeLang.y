%{
#include <iostream>
#include "GraphicalApp.h"
#include "Lexems.h"

#define YYSTYPE Value*
//#define DEBUG

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
extern FunctionCallee printFunc;

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
%token PrintToken
%token UpdateScreenToken
%token EndlToken

%%

Parse: Program {YYACCEPT;}

Program: RoutineDeclaration {}
         | VariableDeclaration {}
         | Program VariableDeclaration {}
         | Program RoutineDeclaration {}

VariableDeclaration : Identifier '=' IntLiteral EndlToken {
#ifdef DEBUG
                            printf("Identifier '=' IntLiteral ';'\n");
#endif
                            module->getOrInsertGlobal((char*)$1, builder->getInt32Ty());
                            value_t val;
                            val.irVal = module->getNamedGlobal((char*)$1);
                            val.realVal = atoi((char*)$3);
                            ValueMap.insert({(char*)$1, val});
                        }

RoutineDeclaration : FunctionBegin Identifier '{'  {
#ifdef DEBUG
                            printf("FunctionBegin Identifier ...\n");
#endif
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
#ifdef DEBUG
                            printf("... Statements FunctionEnd\n");
#endif
                            builder->CreateRetVoid();
                        }

Statements: Assignment {
#ifdef DEBUG
          printf("Assignment\n");
#endif
}
            | Crawl  {}
            | Var {}
            | IfStatement {}
            | Label {}
            | PutPixel  {}
            | Print  {}
            | UpdateScreen {}
            | RoutineCall {}
            | Statements Var {
#ifdef DEBUG
printf("Statements VExpressio\n");
#endif
}
            | Statements Assignment {
#ifdef DEBUG
printf("Statements Assignment\n");
#endif
}
            | Statements RoutineCall {
#ifdef DEBUG
printf("Statements RoutineCall\n");
#endif
}
            | Statements IfStatement {
#ifdef DEBUG
printf("Statements IfStatement\n");
#endif
}
            | Statements Label {
#ifdef DEBUG
printf("Statements Label\n");
#endif
}
            | Statements Crawl {
#ifdef DEBUG
printf("Statements Crawl\n");
#endif
}
            | Statements PutPixel {
#ifdef DEBUG
printf("Statements PutPixel\n");
#endif
}
            | Statements Print {
#ifdef DEBUG
printf("Statements Print\n");
#endif
}
            | Statements UpdateScreen {
#ifdef DEBUG
printf("Statements UpdateScreen\n");
#endif
}

PutPixel : PutPixelToken '('Expression','Expression','Expression')' EndlToken {
                            Value *args[] = {$3, $5, $7};
                            builder->CreateCall(putPixelFunc, args);
                        }

Print : PrintToken'('Expression')'EndlToken {
                            Value *args[] = {builder->CreateGlobalStringPtr("%d\n"), $3};
                            builder->CreateCall(printFunc, args);
                        }

Var : Expression EndlToken {}

UpdateScreen : UpdateScreenToken EndlToken { builder->CreateCall(updateScreenFunc); }

Assignment: Identifier '=' Expression EndlToken { 
#ifdef DEBUG
          printf("Value '=' Expression EndlToken\n"); 
#endif
        if (ValueMap.find((char*)$1) == ValueMap.end()) {
                              module->getOrInsertGlobal((char*)$1, builder->getInt32Ty());
                              value_t val;
                              val.irVal = module->getNamedGlobal((char*)$1);
                              val.realVal = 100500;
                              ValueMap.insert({(char*)$1, val});
                            }
          builder->CreateStore($3, ValueMap[(char*)$1].irVal); 
}

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
#ifdef DEBUG
                              printf("Declaration or usage\n");
#endif
                            if (ValueMap.find((char*)$1) == ValueMap.end()) {
                              module->getOrInsertGlobal((char*)$1, builder->getInt32Ty());
                              value_t val;
                              val.irVal = module->getNamedGlobal((char*)$1);
                              val.realVal = 100500;
                              ValueMap.insert({(char*)$1, val});
                            }
                            $$ = builder->CreateConstGEP1_32(builder->getInt32Ty(), ValueMap[(char*)$1].irVal, 0);
                        }
%%
