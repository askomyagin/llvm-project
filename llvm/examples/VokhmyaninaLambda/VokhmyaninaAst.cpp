#include "VokhmyaninaAst.hpp"


llvm::Value* VarExpr::varValue = NULL;

llvm::Value* NumExpr::gen(llvm::IRBuilder<> *builder, llvm::LLVMContext &context) const {
return llvm::ConstantInt::get (llvm::Type::getInt32Ty(context), num);
}

llvm::Value* VarExpr::gen(llvm::IRBuilder<> *builder, llvm::LLVMContext &context) const {
llvm::Value* var = VarExpr::varValue;
return var ? var : NULL;
}

llvm::Value* AddExpr::gen(llvm::IRBuilder<> *builder, llvm::LLVMContext &context) const {
llvm::Value* v1 = op1->gen(builder, context); llvm::Value* v2 = op2->gen(builder, context);
return builder->CreateAdd(v1, v2, "addtmp");
}

llvm::Value* MulExpr::gen(llvm::IRBuilder<> *builder, llvm::LLVMContext &context) const {
llvm::Value* v1 = op1->gen(builder, context); llvm::Value* v2 = op2->gen(builder, context);
return builder->CreateMul(v1, v2, "multmp");
}

llvm::Value* PowExpr::gen(llvm::IRBuilder<> *builder, llvm::LLVMContext &context) const {
llvm::Value* v1 = op1->gen(builder, context); llvm::Value* v2 = op2->gen(builder, context);
v1 = builder->CreateSIToFP(v1, llvm::Type::getDoubleTy(context));
v2 = builder->CreateSIToFP(v2, llvm::Type::getDoubleTy(context));
llvm::Value* res = builder->CreateBinaryIntrinsic(llvm::Intrinsic::pow, v1, v2, nullptr, "powtmp");
res = builder->CreateFPToSI(res, llvm::Type::getInt32Ty(context));
return res;
}
