#pragma once




#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/PassManager.h"

#include "llvm/ADT/Statistic.h"


namespace llvm {

	class VoronovaLab2 : public PassInfoMixin<VoronovaLab2>

	{
	  public:
		PreservedAnalyses run(Function& F, FunctionAnalysisManager& AM);
		static bool isRequired() { return true; }
	};

}
