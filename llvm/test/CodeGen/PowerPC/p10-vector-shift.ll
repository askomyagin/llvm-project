; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr10 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr < %s | \
; RUN:   FileCheck %s

; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu \
; RUN:   -mcpu=pwr10 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr < %s | \
; RUN:   FileCheck %s

; These test cases demonstrate that the vector shift quadword instructions
; introduced within Power10 are correctly exploited.

define dso_local <1 x i128> @test_vec_vslq(<1 x i128> %a, <1 x i128> %b) {
; CHECK-LABEL: test_vec_vslq:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vslq v2, v2, v3
; CHECK-NEXT:    blr
entry:
  %rem = urem <1 x i128> %b, <i128 128>
  %shl = shl <1 x i128> %a, %rem
  ret <1 x i128> %shl
}

define dso_local <1 x i128> @test_vec_vsrq(<1 x i128> %a, <1 x i128> %b) {
; CHECK-LABEL: test_vec_vsrq:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsrq v2, v2, v3
; CHECK-NEXT:    blr
entry:
  %rem = urem <1 x i128> %b, <i128 128>
  %shr = lshr <1 x i128> %a, %rem
  ret <1 x i128> %shr
}

define dso_local <1 x i128> @test_vec_vsraq(<1 x i128> %a, <1 x i128> %b) {
; CHECK-LABEL: test_vec_vsraq:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsraq v2, v2, v3
; CHECK-NEXT:    blr
entry:
  %rem = urem <1 x i128> %b, <i128 128>
  %shr = ashr <1 x i128> %a, %rem
  ret <1 x i128> %shr
}

define dso_local <1 x i128> @test_vec_vslq2(<1 x i128> %a, <1 x i128> %b) {
; CHECK-LABEL: test_vec_vslq2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vslq v2, v2, v3
; CHECK-NEXT:    blr
entry:
  %shl = shl <1 x i128> %a, %b
  ret <1 x i128> %shl
}

define dso_local <1 x i128> @test_vec_vsrq2(<1 x i128> %a, <1 x i128> %b) {
; CHECK-LABEL: test_vec_vsrq2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsrq v2, v2, v3
; CHECK-NEXT:    blr
entry:
  %shr = lshr <1 x i128> %a, %b
  ret <1 x i128> %shr
}

define dso_local <1 x i128> @test_vec_vsraq2(<1 x i128> %a, <1 x i128> %b) {
; CHECK-LABEL: test_vec_vsraq2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsraq v2, v2, v3
; CHECK-NEXT:    blr
entry:
  %shr = ashr <1 x i128> %a, %b
  ret <1 x i128> %shr
}