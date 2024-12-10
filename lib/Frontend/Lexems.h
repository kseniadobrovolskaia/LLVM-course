#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
extern "C" {
#ifdef YYPARSE_PARAM
int yyparse();
#endif
int yylex();
void yyerror(char *s);
int yywrap(void);
}

typedef struct {
  GlobalVariable *irVal;
  int realVal;
} value_t;
