add_llvm_component_library(LLVMaanoskovStatPass
  aanoskovStatPass.cpp

  ADDITIONAL_HEADER_DIRS
  ${LLVM_MAIN_INCLUDE_DIR}/llvm/Transforms
  ${LLVM_MAIN_INCLUDE_DIR}/llvm/Transforms/aanoskovStatPass
)