ifneq ($(TARGET_USE_PRIVATE_LIBM),true)
LOCAL_PATH:= $(call my-dir)

bionic_coverage := false

ifneq (,$(filter $(TARGET_ARCH),x86 x86_64))
# Clang has wrong long double sizes for x86.
libm_clang := false
endif

# -----------------------------------------------------------------------------
# libm.a
# -----------------------------------------------------------------------------
include $(CLEAR_VARS)

LOCAL_MODULE := libm

LOCAL_SRC_FILES := \
    upstream-freebsd/lib/msun/bsdsrc/b_exp.c \
    upstream-freebsd/lib/msun/bsdsrc/b_log.c \
    upstream-freebsd/lib/msun/bsdsrc/b_tgamma.c \
    upstream-freebsd/lib/msun/src/catrig.c \
    upstream-freebsd/lib/msun/src/catrigf.c \
    upstream-freebsd/lib/msun/src/e_acosf.c \
    upstream-freebsd/lib/msun/src/e_acosh.c \
    upstream-freebsd/lib/msun/src/e_acoshf.c \
    upstream-freebsd/lib/msun/src/e_asinf.c \
    upstream-freebsd/lib/msun/src/e_atan2f.c \
    upstream-freebsd/lib/msun/src/e_atanh.c \
    upstream-freebsd/lib/msun/src/e_atanhf.c \
    upstream-freebsd/lib/msun/src/e_coshf.c \
    upstream-freebsd/lib/msun/src/e_expf.c \
    upstream-freebsd/lib/msun/src/e_fmod.c \
    upstream-freebsd/lib/msun/src/e_fmodf.c \
    upstream-freebsd/lib/msun/src/e_gamma.c \
    upstream-freebsd/lib/msun/src/e_gammaf.c \
    upstream-freebsd/lib/msun/src/e_gammaf_r.c \
    upstream-freebsd/lib/msun/src/e_gamma_r.c \
    upstream-freebsd/lib/msun/src/e_hypotf.c \
    upstream-freebsd/lib/msun/src/e_j0.c \
    upstream-freebsd/lib/msun/src/e_j0f.c \
    upstream-freebsd/lib/msun/src/e_j1.c \
    upstream-freebsd/lib/msun/src/e_j1f.c \
    upstream-freebsd/lib/msun/src/e_jn.c \
    upstream-freebsd/lib/msun/src/e_jnf.c \
    upstream-freebsd/lib/msun/src/e_lgamma.c \
    upstream-freebsd/lib/msun/src/e_lgammaf.c \
    upstream-freebsd/lib/msun/src/e_lgammaf_r.c \
    upstream-freebsd/lib/msun/src/e_lgamma_r.c \
    upstream-freebsd/lib/msun/src/e_log10f.c \
    upstream-freebsd/lib/msun/src/e_log2.c \
    upstream-freebsd/lib/msun/src/e_log2f.c \
    upstream-freebsd/lib/msun/src/e_logf.c \
    upstream-freebsd/lib/msun/src/e_powf.c \
    upstream-freebsd/lib/msun/src/e_remainder.c \
    upstream-freebsd/lib/msun/src/e_remainderf.c \
    upstream-freebsd/lib/msun/src/e_rem_pio2f.c \
    upstream-freebsd/lib/msun/src/e_scalb.c \
    upstream-freebsd/lib/msun/src/e_scalbf.c \
    upstream-freebsd/lib/msun/src/e_sinhf.c \
    upstream-freebsd/lib/msun/src/imprecise.c \
    upstream-freebsd/lib/msun/src/k_cos.c \
    upstream-freebsd/lib/msun/src/k_cosf.c \
    upstream-freebsd/lib/msun/src/k_exp.c \
    upstream-freebsd/lib/msun/src/k_expf.c \
    upstream-freebsd/lib/msun/src/k_sin.c \
    upstream-freebsd/lib/msun/src/k_sinf.c \
    upstream-freebsd/lib/msun/src/k_tan.c \
    upstream-freebsd/lib/msun/src/k_tanf.c \
    upstream-freebsd/lib/msun/src/s_asinh.c \
    upstream-freebsd/lib/msun/src/s_asinhf.c \
    upstream-freebsd/lib/msun/src/s_atanf.c \
    upstream-freebsd/lib/msun/src/s_carg.c \
    upstream-freebsd/lib/msun/src/s_cargf.c \
    upstream-freebsd/lib/msun/src/s_cargl.c \
    upstream-freebsd/lib/msun/src/s_cbrtf.c \
    upstream-freebsd/lib/msun/src/s_ccosh.c \
    upstream-freebsd/lib/msun/src/s_ccoshf.c \
    upstream-freebsd/lib/msun/src/s_cexp.c \
    upstream-freebsd/lib/msun/src/s_cexpf.c \
    upstream-freebsd/lib/msun/src/s_cimag.c \
    upstream-freebsd/lib/msun/src/s_cimagf.c \
    upstream-freebsd/lib/msun/src/s_cimagl.c \
    upstream-freebsd/lib/msun/src/s_conj.c \
    upstream-freebsd/lib/msun/src/s_conjf.c \
    upstream-freebsd/lib/msun/src/s_conjl.c \
    upstream-freebsd/lib/msun/src/s_copysign.c \
    upstream-freebsd/lib/msun/src/s_copysignf.c \
    upstream-freebsd/lib/msun/src/s_cosf.c \
    upstream-freebsd/lib/msun/src/s_cproj.c \
    upstream-freebsd/lib/msun/src/s_cprojf.c \
    upstream-freebsd/lib/msun/src/s_cprojl.c \
    upstream-freebsd/lib/msun/src/s_creal.c \
    upstream-freebsd/lib/msun/src/s_crealf.c \
    upstream-freebsd/lib/msun/src/s_creall.c \
    upstream-freebsd/lib/msun/src/s_csinh.c \
    upstream-freebsd/lib/msun/src/s_csinhf.c \
    upstream-freebsd/lib/msun/src/s_csqrt.c \
    upstream-freebsd/lib/msun/src/s_csqrtf.c \
    upstream-freebsd/lib/msun/src/s_csqrtl.c \
    upstream-freebsd/lib/msun/src/s_ctanh.c \
    upstream-freebsd/lib/msun/src/s_ctanhf.c \
    upstream-freebsd/lib/msun/src/s_erf.c \
    upstream-freebsd/lib/msun/src/s_erff.c \
    upstream-freebsd/lib/msun/src/s_exp2.c \
    upstream-freebsd/lib/msun/src/s_exp2f.c \
    upstream-freebsd/lib/msun/src/s_expm1f.c \
    upstream-freebsd/lib/msun/src/s_fdim.c \
    upstream-freebsd/lib/msun/src/s_finite.c \
    upstream-freebsd/lib/msun/src/s_finitef.c \
    upstream-freebsd/lib/msun/src/s_floorf.c \
    upstream-freebsd/lib/msun/src/s_fma.c \
    upstream-freebsd/lib/msun/src/s_fmaf.c \
    upstream-freebsd/lib/msun/src/s_fmax.c \
    upstream-freebsd/lib/msun/src/s_fmaxf.c \
    upstream-freebsd/lib/msun/src/s_fmin.c \
    upstream-freebsd/lib/msun/src/s_fminf.c \
    upstream-freebsd/lib/msun/src/s_frexp.c \
    upstream-freebsd/lib/msun/src/s_frexpf.c \
    upstream-freebsd/lib/msun/src/s_ilogb.c \
    upstream-freebsd/lib/msun/src/s_ilogbf.c \
    upstream-freebsd/lib/msun/src/s_log1pf.c \
    upstream-freebsd/lib/msun/src/s_logb.c \
    upstream-freebsd/lib/msun/src/s_logbf.c \
    upstream-freebsd/lib/msun/src/s_modff.c \
    upstream-freebsd/lib/msun/src/s_nan.c \
    upstream-freebsd/lib/msun/src/s_nearbyint.c \
    upstream-freebsd/lib/msun/src/s_nextafter.c \
    upstream-freebsd/lib/msun/src/s_nextafterf.c \
    upstream-freebsd/lib/msun/src/s_remquo.c \
    upstream-freebsd/lib/msun/src/s_remquof.c \
    upstream-freebsd/lib/msun/src/s_scalbln.c \
    upstream-freebsd/lib/msun/src/s_scalbn.c \
    upstream-freebsd/lib/msun/src/s_scalbnf.c \
    upstream-freebsd/lib/msun/src/s_signgam.c \
    upstream-freebsd/lib/msun/src/s_significand.c \
    upstream-freebsd/lib/msun/src/s_significandf.c \
    upstream-freebsd/lib/msun/src/s_sinf.c \
    upstream-freebsd/lib/msun/src/s_tanf.c \
    upstream-freebsd/lib/msun/src/s_tanhf.c \
    upstream-freebsd/lib/msun/src/s_tgammaf.c \
    upstream-freebsd/lib/msun/src/w_cabs.c \
    upstream-freebsd/lib/msun/src/w_cabsf.c \
    upstream-freebsd/lib/msun/src/w_cabsl.c \
    upstream-freebsd/lib/msun/src/w_drem.c \
    upstream-freebsd/lib/msun/src/w_dremf.c \

libm_common_cflags := -DFLT_EVAL_METHOD=0
libm_common_includes := $(LOCAL_PATH)/upstream-freebsd/lib/msun/src/

libm_arm_includes := $(LOCAL_PATH)/arm
libm_arm_src_files := arm/fenv.c

ifneq ($(TARGET_ARCH),arm)
libm_common_src_files += \
    upstream-freebsd/lib/msun/src/s_floor.c \
    upstream-freebsd/lib/msun/src/e_sqrt.c \
    upstream-freebsd/lib/msun/src/e_sqrtf.c \
    upstream-freebsd/lib/msun/src/s_cos.c \
    upstream-freebsd/lib/msun/src/s_sin.c
endif

ifeq ($(TARGET_CPU_VARIANT),cortex-a9)
libm_arm_src_files += \
    arm/k_log2.S \
    arm/e_sqrt.S \
    arm/e_sqrtf.S \
    arm/s_floor.S
else
ifeq ($(TARGET_CPU_VARIANT),$(filter $(TARGET_CPU_VARIANT),cortex-a15 krait))
libm_arm_src_files += \
    arm/k_log2.S \
    arm/k_exp.S \
    arm/e_fast_exp.S \
    arm/e_sqrt.S \
    arm/e_sqrtf.S \
    arm/s_floor.S \
    arm/e_rem_pio2_fast.S \
    arm/e_rem_pio2_large.c \
    arm/k_sin_fast.S \
    arm/k_cos_fast.S \
    arm/s_sin_fast.S \
    arm/s_cos_fast.S \
    arm/e_pow.S
libm_arm_cflags += -DLIBM_OPT_SIN_COS -DLIBM_OPT_EXP -DPRECISE_TRIGONOMETRIC -DKRAIT_NEON_OPTIMIZATION -fno-if-conversion
libm_arm_asflags += -DFPU_VFPV4 -DLIBM_OPT_SIN_COS -DLIBM_OPT_EXP -DPRECISE_TRIGONOMETRIC
else
libm_arm_src_files += \
    upstream-freebsd/lib/msun/src/s_floor.c \
    upstream-freebsd/lib/msun/src/e_sqrt.c \
    upstream-freebsd/lib/msun/src/e_sqrtf.c \
    upstream-freebsd/lib/msun/src/s_cos.c \
    upstream-freebsd/lib/msun/src/s_sin.c
endif
endif

LOCAL_SRC_FILES_arm += \
    arm/atan.S \
    arm/ceilf.S \
    arm/cos.S \
    arm/cos_kernel.S \
    arm/exp.S \
    arm/fabsf.S \
    arm/floor.S \
    arm/floorf.S \
    arm/fma.S \
    arm/log.S \
    arm/log2_kernel.S \
    arm/lrint.S \
    arm/modf.S \
    arm/pow.S \
    arm/pow2_kernel.S \
    arm/rem_pio2_fast.S \
    arm/rem_pio2_kernel.S \
    arm/rem_pio2_large.c \
    arm/sin.S \
    arm/sin_kernel.S \
    arm/sqrt.S \

LOCAL_CFLAGS_arm += -DNEON_OPTIMIZATION -fno-if-conversion

# -----------------------------------------------------------------------------
# arm64
# -----------------------------------------------------------------------------
LOCAL_SRC_FILES_arm64 += \
    arm64/atan.S \
    arm64/ceil.S \
    arm64/exp.S \
    arm64/fabs.S \
    arm64/fenv.c \
    arm64/floor.S \
    arm64/fma.S \
    arm64/fmax.S \
    arm64/fmin.S \
    arm64/log.S \
    arm64/lrint.S \
    arm64/lround.S \
    arm64/rem_pio2.S \
    arm64/rem_pio2_kernel.S \
    arm64/rint.S \
    arm64/round.S \
    arm64/sqrt.S \
    arm64/trunc.S \
    upstream-freebsd/lib/msun/src/e_acos.c \
    upstream-freebsd/lib/msun/src/e_asin.c \
    upstream-freebsd/lib/msun/src/e_atan2.c \
    upstream-freebsd/lib/msun/src/e_cosh.c \
    upstream-freebsd/lib/msun/src/e_hypot.c \
    upstream-freebsd/lib/msun/src/e_log10.c \
    upstream-freebsd/lib/msun/src/e_sinh.c \
    upstream-freebsd/lib/msun/src/s_cbrt.c \
    upstream-freebsd/lib/msun/src/s_cos.c \
    upstream-freebsd/lib/msun/src/s_expm1.c \
    upstream-freebsd/lib/msun/src/s_log1p.c \
    upstream-freebsd/lib/msun/src/s_modf.c \
    upstream-freebsd/lib/msun/src/e_pow.c \
    upstream-freebsd/lib/msun/src/e_sin.c \
    upstream-freebsd/lib/msun/src/s_tan.c \
    upstream-freebsd/lib/msun/src/s_tanh.c \

# -----------------------------------------------------------------------------
# mips
# -----------------------------------------------------------------------------
libm_mips_arch_files := \
    mips/fenv.c \
    upstream-freebsd/lib/msun/src/e_acos.c \
    upstream-freebsd/lib/msun/src/e_asin.c \
    upstream-freebsd/lib/msun/src/e_atan2.c \
    upstream-freebsd/lib/msun/src/e_cosh.c \
    upstream-freebsd/lib/msun/src/e_exp.c \
    upstream-freebsd/lib/msun/src/e_hypot.c \
    upstream-freebsd/lib/msun/src/e_log.c \
    upstream-freebsd/lib/msun/src/e_log10.c \
    upstream-freebsd/lib/msun/src/e_pow.c \
    upstream-freebsd/lib/msun/src/e_sinh.c \
    upstream-freebsd/lib/msun/src/e_sqrt.c \
    upstream-freebsd/lib/msun/src/e_sqrtf.c \
    upstream-freebsd/lib/msun/src/s_atan.c \
    upstream-freebsd/lib/msun/src/s_cbrt.c \
    upstream-freebsd/lib/msun/src/s_ceil.c \
    upstream-freebsd/lib/msun/src/s_ceilf.c \
    upstream-freebsd/lib/msun/src/s_cos.c \
    upstream-freebsd/lib/msun/src/s_fabs.c \
    upstream-freebsd/lib/msun/src/s_fabsf.c \
    upstream-freebsd/lib/msun/src/s_floor.c \
    upstream-freebsd/lib/msun/src/s_floorf.c \
    upstream-freebsd/lib/msun/src/s_fma.c \
    upstream-freebsd/lib/msun/src/s_fmaf.c \
    upstream-freebsd/lib/msun/src/s_fmax.c \
    upstream-freebsd/lib/msun/src/s_fmaxf.c \
    upstream-freebsd/lib/msun/src/s_fmin.c \
    upstream-freebsd/lib/msun/src/s_fminf.c \
    upstream-freebsd/lib/msun/src/s_expm1.c \
    upstream-freebsd/lib/msun/src/s_llrint.c \
    upstream-freebsd/lib/msun/src/s_llrintf.c \
    upstream-freebsd/lib/msun/src/s_llround.c \
    upstream-freebsd/lib/msun/src/s_llroundf.c \
    upstream-freebsd/lib/msun/src/s_log1p.c \
    upstream-freebsd/lib/msun/src/s_lrint.c \
    upstream-freebsd/lib/msun/src/s_lrintf.c \
    upstream-freebsd/lib/msun/src/s_lround.c \
    upstream-freebsd/lib/msun/src/s_lroundf.c \
    upstream-freebsd/lib/msun/src/s_modf.c \
    upstream-freebsd/lib/msun/src/s_rint.c \
    upstream-freebsd/lib/msun/src/s_rintf.c \
    upstream-freebsd/lib/msun/src/s_round.c \
    upstream-freebsd/lib/msun/src/s_roundf.c \
    upstream-freebsd/lib/msun/src/s_sin.c \
    upstream-freebsd/lib/msun/src/s_tan.c \
    upstream-freebsd/lib/msun/src/s_tanh.c \
    upstream-freebsd/lib/msun/src/s_trunc.c \
    upstream-freebsd/lib/msun/src/s_truncf.c \
    upstream-freebsd/lib/msun/src/s_fabsf.c \
    upstream-freebsd/lib/msun/src/e_rem_pio2.c \
    upstream-freebsd/lib/msun/src/k_rem_pio2.c \

LOCAL_SRC_FILES_mips += $(libm_mips_arch_files)
LOCAL_SRC_FILES_mips64 += $(libm_mips_arch_files)

# -----------------------------------------------------------------------------
# x86
# -----------------------------------------------------------------------------
LOCAL_SRC_FILES_x86 += \
    i387/fenv.c \
    upstream-freebsd/lib/msun/src/s_fabs.c \
    upstream-freebsd/lib/msun/src/s_fabsf.c \
    upstream-freebsd/lib/msun/src/s_fma.c \
    upstream-freebsd/lib/msun/src/s_fmaf.c \
    upstream-freebsd/lib/msun/src/s_fmax.c \
    upstream-freebsd/lib/msun/src/s_fmaxf.c \
    upstream-freebsd/lib/msun/src/s_fmin.c \
    upstream-freebsd/lib/msun/src/s_fminf.c \
    upstream-freebsd/lib/msun/src/s_llrint.c \
    upstream-freebsd/lib/msun/src/s_llrintf.c \
    upstream-freebsd/lib/msun/src/s_llround.c \
    upstream-freebsd/lib/msun/src/s_llroundf.c \
    upstream-freebsd/lib/msun/src/s_lrint.c \
    upstream-freebsd/lib/msun/src/s_lrintf.c \
    upstream-freebsd/lib/msun/src/s_lround.c \
    upstream-freebsd/lib/msun/src/s_lroundf.c \
    upstream-freebsd/lib/msun/src/s_modf.c \
    upstream-freebsd/lib/msun/src/s_rint.c \
    upstream-freebsd/lib/msun/src/s_rintf.c \
    upstream-freebsd/lib/msun/src/s_round.c \
    upstream-freebsd/lib/msun/src/s_roundf.c \
    upstream-freebsd/lib/msun/src/s_fabsf.c \
    upstream-freebsd/lib/msun/src/e_rem_pio2.c \
    upstream-freebsd/lib/msun/src/k_rem_pio2.c \
    x86/sqrt.S \
    x86/sqrtf.S \
    x86/e_acos.S \
    x86/e_asin.S \
    x86/e_atan2.S \
    x86/e_cosh.S \
    x86/e_exp.S \
    x86/e_hypot.S \
    x86/e_log10.S \
    x86/e_log.S \
    x86/e_pow.S \
    x86/e_sinh.S \
    x86/libm_reduce_pi04l.S \
    x86/libm_sincos_huge.S \
    x86/libm_tancot_huge.S \
    x86/s_atan.S \
    x86/s_cbrt.S \
    x86/s_cos.S \
    x86/s_expm1.S \
    x86/s_log1p.S \
    x86/s_sin.S \
    x86/s_tanh.S \
    x86/s_tan.S \

ifeq ($(ARCH_X86_HAVE_SSE4_1),true)
LOCAL_SRC_FILES_x86 += \
    x86/ceil.S \
    x86/ceilf.S \
    x86/floor.S \
    x86/floorf.S \
    x86/trunc.S \
    x86/truncf.S \

else
LOCAL_SRC_FILES_x86 += \
    upstream-freebsd/lib/msun/src/s_ceil.c \
    upstream-freebsd/lib/msun/src/s_ceilf.c \
    upstream-freebsd/lib/msun/src/s_floor.c \
    upstream-freebsd/lib/msun/src/s_floorf.c \
    upstream-freebsd/lib/msun/src/s_trunc.c \
    upstream-freebsd/lib/msun/src/s_truncf.c \

endif

# -----------------------------------------------------------------------------
# x86_64
# -----------------------------------------------------------------------------
LOCAL_SRC_FILES_x86_64 += \
    amd64/fenv.c \
    upstream-freebsd/lib/msun/src/s_fabs.c \
    upstream-freebsd/lib/msun/src/s_fabsf.c \
    upstream-freebsd/lib/msun/src/s_fma.c \
    upstream-freebsd/lib/msun/src/s_fmaf.c \
    upstream-freebsd/lib/msun/src/s_fmax.c \
    upstream-freebsd/lib/msun/src/s_fmaxf.c \
    upstream-freebsd/lib/msun/src/s_fmin.c \
    upstream-freebsd/lib/msun/src/s_fminf.c \
    upstream-freebsd/lib/msun/src/s_llrint.c \
    upstream-freebsd/lib/msun/src/s_llrintf.c \
    upstream-freebsd/lib/msun/src/s_llround.c \
    upstream-freebsd/lib/msun/src/s_llroundf.c \
    upstream-freebsd/lib/msun/src/s_lrint.c \
    upstream-freebsd/lib/msun/src/s_lrintf.c \
    upstream-freebsd/lib/msun/src/s_lround.c \
    upstream-freebsd/lib/msun/src/s_lroundf.c \
    upstream-freebsd/lib/msun/src/s_modf.c \
    upstream-freebsd/lib/msun/src/s_rint.c \
    upstream-freebsd/lib/msun/src/s_rintf.c \
    upstream-freebsd/lib/msun/src/s_round.c \
    upstream-freebsd/lib/msun/src/s_roundf.c \
    upstream-freebsd/lib/msun/src/s_fabsf.c \
    upstream-freebsd/lib/msun/src/e_rem_pio2.c \
    upstream-freebsd/lib/msun/src/k_rem_pio2.c \
    x86_64/sqrt.S \
    x86_64/sqrtf.S \
    x86_64/e_acos.S \
    x86_64/e_asin.S \
    x86_64/e_atan2.S \
    x86_64/e_cosh.S \
    x86_64/e_exp.S \
    x86_64/e_hypot.S \
    x86_64/e_log10.S \
    x86_64/e_log.S \
    x86_64/e_pow.S \
    x86_64/e_sinh.S \
    x86_64/s_atan.S \
    x86_64/s_cbrt.S \
    x86_64/s_cos.S \
    x86_64/s_expm1.S \
    x86_64/s_log1p.S \
    x86_64/s_sin.S \
    x86_64/s_tanh.S \
    x86_64/s_tan.S \

ifeq ($(ARCH_X86_HAVE_SSE4_1),true)
LOCAL_SRC_FILES_x86_64 += \
    x86_64/ceil.S \
    x86_64/ceilf.S \
    x86_64/floor.S \
    x86_64/floorf.S \
    x86_64/trunc.S \
    x86_64/truncf.S \

else
LOCAL_SRC_FILES_x86_64 += \
    upstream-freebsd/lib/msun/src/s_ceil.c \
    upstream-freebsd/lib/msun/src/s_ceilf.c \
    upstream-freebsd/lib/msun/src/s_floor.c \
    upstream-freebsd/lib/msun/src/s_floorf.c \
    upstream-freebsd/lib/msun/src/s_trunc.c \
    upstream-freebsd/lib/msun/src/s_truncf.c \

endif

LOCAL_C_INCLUDES_x86 += $(LOCAL_PATH)/i387

LOCAL_C_INCLUDES += $(LOCAL_PATH)/upstream-freebsd/lib/msun/src/
LOCAL_C_INCLUDES_64 += $(LOCAL_PATH)/upstream-freebsd/lib/msun/ld128/

LOCAL_CLANG := $(libm_clang)
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := $(libm_common_cflags) $(libm_$(TARGET_ARCH)_cflags)
LOCAL_C_INCLUDES += $(libm_common_includes) $(libm_$(TARGET_ARCH)_includes)
LOCAL_ASFLAGS := $(libm_common_asflags)
LOCAL_SRC_FILES := $(libm_common_src_files) $(libm_$(TARGET_ARCH)_src_files)
LOCAL_SYSTEM_SHARED_LIBRARIES := libc
include $(BUILD_STATIC_LIBRARY)

# -----------------------------------------------------------------------------
# libm.so
# -----------------------------------------------------------------------------
include $(CLEAR_VARS)

LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/libm.map

# TODO: This is to work around b/19059885. Remove after root cause is fixed
LOCAL_LDFLAGS_arm := -Wl,--hash-style=both
LOCAL_LDFLAGS_x86 := -Wl,--hash-style=both

LOCAL_LDFLAGS := -Wl,--version-script,$(LOCAL_PATH)/libm.map

LOCAL_MODULE := libm
LOCAL_CLANG := $(libm_clang)
LOCAL_SYSTEM_SHARED_LIBRARIES := libc
LOCAL_WHOLE_STATIC_LIBRARIES := libm

LOCAL_NATIVE_COVERAGE := $(bionic_coverage)
LOCAL_ADDRESS_SANITIZER := false

LOCAL_CXX_STL := none

# We'd really like to do this for all architectures, but since this wasn't done
# before, these symbols must continue to be exported on LP32 for binary
# compatibility.
LOCAL_LDFLAGS_64 := -Wl,--exclude-libs,libgcc.a

include $(BUILD_SHARED_LIBRARY)
endif
