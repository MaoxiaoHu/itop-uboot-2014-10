	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"asm-offsets.c"
@ GNU C (crosstool-NG 1.19.0) version 4.7.3 (arm-cortex_a8-linux-gnueabi)
@	compiled by GNU C version 4.4.5, GMP version 4.3.2, MPFR version 2.4.2-p2, MPC version 1.0.1
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc -I include
@ -I /home/topo/Documents/itop-uboot-2014-10/arch/arm/cpu/armv7/exynos
@ -I /home/topo/Documents/itop-uboot-2014-10/arch/arm/include
@ -iprefix /home/topo/Documents/arm-linux-4.7.3/bin/../lib/gcc/arm-cortex_a8-linux-gnueabi/4.7.3/
@ -isysroot /home/topo/Documents/arm-linux-4.7.3/bin/../arm-cortex_a8-linux-gnueabi/sysroot
@ -D __KERNEL__ -D __UBOOT__ -D CONFIG_SYS_TEXT_BASE=0x7de00000 -D __ARM__
@ -D DO_DEPS_ONLY -D KBUILD_STR(s)=#s
@ -D KBUILD_BASENAME=KBUILD_STR(asm_offsets)
@ -D KBUILD_MODNAME=KBUILD_STR(asm_offsets)
@ -isystem /home/topo/Documents/arm-linux-4.7.3/bin/../lib/gcc/arm-cortex_a8-linux-gnueabi/4.7.3/include
@ -include /home/topo/Documents/itop-uboot-2014-10/include/linux/kconfig.h
@ -MD lib/.asm-offsets.s.d lib/asm-offsets.c -marm -mno-thumb-interwork
@ -mabi=aapcs-linux -mword-relocations -march=armv7-a -mno-unaligned-access
@ -mfloat-abi=soft -mtune=cortex-a8 -mtls-dialect=gnu
@ -auxbase-strip lib/asm-offsets.s -g -Os -Wall -Wstrict-prototypes
@ -Wno-format-security -Wno-format-nonliteral -fno-builtin -ffreestanding
@ -fno-stack-protector -fstack-usage -ffunction-sections -fdata-sections
@ -fno-common -ffixed-r9 -fverbose-asm
@ options enabled:  -fauto-inc-dec -fbranch-count-reg -fcaller-saves
@ -fcombine-stack-adjustments -fcompare-elim -fcprop-registers
@ -fcrossjumping -fcse-follow-jumps -fdata-sections -fdebug-types-section
@ -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize -fdwarf2-cfi-asm
@ -fearly-inlining -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -ffunction-sections -fgcse -fgcse-lm
@ -fgnu-runtime -fguess-branch-probability -fident -fif-conversion
@ -fif-conversion2 -findirect-inlining -finline -finline-atomics
@ -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-cp -fipa-profile -fipa-pure-const
@ -fipa-reference -fipa-sra -fira-share-save-slots -fira-share-spill-slots
@ -fivopts -fkeep-static-consts -fleading-underscore -fmath-errno
@ -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
@ -fomit-frame-pointer -foptimize-register-move -foptimize-sibling-calls
@ -fpartial-inlining -fpeephole -fpeephole2 -fprefetch-loop-arrays
@ -freg-struct-return -fregmove -freorder-blocks -freorder-functions
@ -frerun-cse-after-loop -fsched-critical-path-heuristic
@ -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
@ -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns2
@ -fsection-anchors -fshow-column -fshrink-wrap -fsigned-zeros
@ -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
@ -fstrict-overflow -fstrict-volatile-bitfields -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
@ -ftree-ccp -ftree-ch -ftree-copy-prop -ftree-copyrename -ftree-cselim
@ -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
@ -ftree-slp-vectorize -ftree-sra -ftree-switch-conversion
@ -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vrp
@ -funit-at-a-time -fvar-tracking -fvar-tracking-assignments -fverbose-asm
@ -fzero-initialized-in-bss -marm -mglibc -mlittle-endian -msched-prolog
@ -mvectorize-with-neon-quad -mword-relocations

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup.main,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB201:
	.file 1 "lib/asm-offsets.c"
	.loc 1 20 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 22 0
#APP
@ 22 "lib/asm-offsets.c" 1
	
.ascii "->GENERATED_GBL_DATA_SIZE #192 (sizeof(struct global_data) + 15) & ~15"	@
@ 0 "" 2
	.loc 1 25 0
@ 25 "lib/asm-offsets.c" 1
	
.ascii "->GENERATED_BD_INFO_SIZE #64 (sizeof(struct bd_info) + 15) & ~15"	@
@ 0 "" 2
	.loc 1 28 0
@ 28 "lib/asm-offsets.c" 1
	
.ascii "->GD_SIZE #184 sizeof(struct global_data)"	@
@ 0 "" 2
	.loc 1 30 0
@ 30 "lib/asm-offsets.c" 1
	
.ascii "->GD_BD #0 offsetof(struct global_data, bd)"	@
@ 0 "" 2
	.loc 1 32 0
@ 32 "lib/asm-offsets.c" 1
	
.ascii "->GD_MALLOC_BASE #136 offsetof(struct global_data, malloc_base)"	@
@ 0 "" 2
	.loc 1 37 0
@ 37 "lib/asm-offsets.c" 1
	
.ascii "->GD_RELOCADDR #48 offsetof(struct global_data, relocaddr)"	@
@ 0 "" 2
	.loc 1 39 0
@ 39 "lib/asm-offsets.c" 1
	
.ascii "->GD_RELOC_OFF #68 offsetof(struct global_data, reloc_off)"	@
@ 0 "" 2
	.loc 1 41 0
@ 41 "lib/asm-offsets.c" 1
	
.ascii "->GD_START_ADDR_SP #64 offsetof(struct global_data, start_addr_sp)"	@
@ 0 "" 2
	.loc 1 46 0
	mov	r0, #0	@,
	bx	lr	@
	.cfi_endproc
.LFE201:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/home/topo/Documents/itop-uboot-2014-10/arch/arm/include/asm/arch/gpio.h"
	.file 3 "/home/topo/Documents/itop-uboot-2014-10/arch/arm/include/asm/u-boot.h"
	.file 4 "include/linux/types.h"
	.file 5 "include/net.h"
	.file 6 "/home/topo/Documents/itop-uboot-2014-10/arch/arm/include/asm/arch/cpu.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x42a
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x1
	.4byte	.LASF60
	.4byte	.LASF61
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x4
	.byte	0x59
	.4byte	0x30
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x8
	.byte	0x2
	.2byte	0x539
	.4byte	0xb4
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x53a
	.4byte	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.2byte	0x53b
	.4byte	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x10
	.byte	0x2
	.2byte	0x597
	.4byte	0xfe
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x598
	.4byte	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x599
	.4byte	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x59a
	.4byte	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x59b
	.4byte	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x8
	.byte	0x8
	.byte	0x3
	.byte	0x23
	.4byte	0x125
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x3
	.byte	0x25
	.4byte	0x7d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x3
	.byte	0x26
	.4byte	0x7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x34
	.byte	0x3
	.byte	0x1d
	.4byte	0x186
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x3
	.byte	0x1e
	.4byte	0x7d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x3
	.byte	0x1f
	.4byte	0x7d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x3
	.byte	0x20
	.4byte	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.byte	0x21
	.4byte	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x3
	.byte	0x22
	.4byte	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.byte	0x27
	.4byte	0x186
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0xb
	.4byte	0x100
	.4byte	0x196
	.uleb128 0xc
	.4byte	0x3e
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x3
	.byte	0x28
	.4byte	0x125
	.uleb128 0xd
	.byte	0x4
	.4byte	0x196
	.uleb128 0xb
	.4byte	0x29
	.4byte	0x1b7
	.uleb128 0xc
	.4byte	0x3e
	.byte	0x5
	.byte	0
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x40
	.byte	0x5
	.byte	0x51
	.4byte	0x26c
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x5
	.byte	0x52
	.4byte	0x26c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x5
	.byte	0x53
	.4byte	0x1a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x5
	.byte	0x54
	.4byte	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x5
	.byte	0x55
	.4byte	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x5
	.byte	0x57
	.4byte	0x297
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x5
	.byte	0x58
	.4byte	0x2b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x5
	.byte	0x59
	.4byte	0x2cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x5
	.byte	0x5a
	.4byte	0x2df
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x5
	.byte	0x5e
	.4byte	0x2cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x5
	.byte	0x5f
	.4byte	0x291
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x5
	.byte	0x60
	.4byte	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x5
	.byte	0x61
	.4byte	0xfe
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.byte	0
	.uleb128 0xb
	.4byte	0x5a
	.4byte	0x27c
	.uleb128 0xc
	.4byte	0x3e
	.byte	0xf
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.4byte	0x45
	.4byte	0x291
	.uleb128 0xf
	.4byte	0x291
	.uleb128 0xf
	.4byte	0x1a1
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x1b7
	.uleb128 0xd
	.byte	0x4
	.4byte	0x27c
	.uleb128 0xe
	.byte	0x1
	.4byte	0x45
	.4byte	0x2b7
	.uleb128 0xf
	.4byte	0x291
	.uleb128 0xf
	.4byte	0xfe
	.uleb128 0xf
	.4byte	0x45
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x29d
	.uleb128 0xe
	.byte	0x1
	.4byte	0x45
	.4byte	0x2cd
	.uleb128 0xf
	.4byte	0x291
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x2bd
	.uleb128 0x10
	.byte	0x1
	.4byte	0x2df
	.uleb128 0xf
	.4byte	0x291
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x2d3
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x4
	.byte	0x5
	.2byte	0x1f2
	.4byte	0x30b
	.uleb128 0x12
	.4byte	.LASF43
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF44
	.sleb128 1
	.uleb128 0x12
	.4byte	.LASF45
	.sleb128 2
	.uleb128 0x12
	.4byte	.LASF46
	.sleb128 3
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.4byte	.LASF63
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.4byte	0x45
	.4byte	.LFB201
	.4byte	.LFE201
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.uleb128 0xb
	.4byte	0x88
	.4byte	0x334
	.uleb128 0xc
	.4byte	0x3e
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x53f
	.4byte	0x324
	.uleb128 0xb
	.4byte	0x88
	.4byte	0x350
	.uleb128 0xc
	.4byte	0x3e
	.byte	0x3
	.byte	0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x546
	.4byte	0x340
	.uleb128 0xb
	.4byte	0x88
	.4byte	0x36c
	.uleb128 0xc
	.4byte	0x3e
	.byte	0x7
	.byte	0
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x54e
	.4byte	0x35c
	.uleb128 0xb
	.4byte	0x88
	.4byte	0x388
	.uleb128 0xc
	.4byte	0x3e
	.byte	0x5
	.byte	0
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x55a
	.4byte	0x378
	.uleb128 0xb
	.4byte	0xb4
	.4byte	0x3a4
	.uleb128 0xc
	.4byte	0x3e
	.byte	0xc
	.byte	0
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x2
	.2byte	0x59f
	.4byte	0x3b0
	.uleb128 0x15
	.4byte	0x394
	.uleb128 0xb
	.4byte	0xb4
	.4byte	0x3c5
	.uleb128 0xc
	.4byte	0x3e
	.byte	0xd
	.byte	0
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x5af
	.4byte	0x3d1
	.uleb128 0x15
	.4byte	0x3b5
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x5c0
	.4byte	0x3e2
	.uleb128 0x15
	.4byte	0x394
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x5d0
	.4byte	0x3f3
	.uleb128 0x15
	.4byte	0x394
	.uleb128 0x16
	.4byte	.LASF55
	.byte	0x6
	.byte	0xb7
	.4byte	0x53
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF56
	.byte	0x6
	.byte	0xb8
	.4byte	0x53
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF57
	.byte	0x5
	.byte	0x6b
	.4byte	0x291
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.4byte	.LASF58
	.byte	0x5
	.2byte	0x1f8
	.4byte	0x2e5
	.byte	0x1
	.byte	0x1
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB201
	.4byte	.LFE201-.LFB201
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB201
	.4byte	.LFE201
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF42:
	.ascii	"priv\000"
.LASF51:
	.ascii	"exynos4_gpio_table\000"
.LASF36:
	.ascii	"send\000"
.LASF49:
	.ascii	"exynos5_gpio_data\000"
.LASF45:
	.ascii	"NETLOOP_SUCCESS\000"
.LASF52:
	.ascii	"exynos4x12_gpio_table\000"
.LASF58:
	.ascii	"net_state\000"
.LASF3:
	.ascii	"sizetype\000"
.LASF63:
	.ascii	"main\000"
.LASF24:
	.ascii	"bi_arm_freq\000"
.LASF9:
	.ascii	"short int\000"
.LASF55:
	.ascii	"s5p_cpu_id\000"
.LASF23:
	.ascii	"bi_boot_params\000"
.LASF50:
	.ascii	"exynos5420_gpio_data\000"
.LASF41:
	.ascii	"index\000"
.LASF30:
	.ascii	"eth_device\000"
.LASF32:
	.ascii	"enetaddr\000"
.LASF60:
	.ascii	"lib/asm-offsets.c\000"
.LASF57:
	.ascii	"eth_current\000"
.LASF33:
	.ascii	"iobase\000"
.LASF29:
	.ascii	"bd_t\000"
.LASF7:
	.ascii	"long long int\000"
.LASF16:
	.ascii	"bank_size\000"
.LASF44:
	.ascii	"NETLOOP_RESTART\000"
.LASF4:
	.ascii	"long int\000"
.LASF22:
	.ascii	"bi_arch_number\000"
.LASF53:
	.ascii	"exynos5_gpio_table\000"
.LASF34:
	.ascii	"state\000"
.LASF31:
	.ascii	"name\000"
.LASF46:
	.ascii	"NETLOOP_FAIL\000"
.LASF21:
	.ascii	"bd_info\000"
.LASF11:
	.ascii	"reg_addr\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF28:
	.ascii	"ulong\000"
.LASF8:
	.ascii	"signed char\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"max_gpio\000"
.LASF43:
	.ascii	"NETLOOP_CONTINUE\000"
.LASF59:
	.ascii	"GNU C 4.7.3\000"
.LASF26:
	.ascii	"bi_ddr_freq\000"
.LASF19:
	.ascii	"start\000"
.LASF2:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"bank\000"
.LASF6:
	.ascii	"char\000"
.LASF35:
	.ascii	"init\000"
.LASF47:
	.ascii	"exynos4_gpio_data\000"
.LASF39:
	.ascii	"write_hwaddr\000"
.LASF38:
	.ascii	"halt\000"
.LASF25:
	.ascii	"bi_dsp_freq\000"
.LASF61:
	.ascii	"/home/topo/Documents/itop-uboot-2014-10\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF14:
	.ascii	"gpio_name_num_table\000"
.LASF48:
	.ascii	"exynos4x12_gpio_data\000"
.LASF20:
	.ascii	"size\000"
.LASF54:
	.ascii	"exynos5420_gpio_table\000"
.LASF27:
	.ascii	"bi_dram\000"
.LASF56:
	.ascii	"s5p_cpu_rev\000"
.LASF37:
	.ascii	"recv\000"
.LASF5:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"base\000"
.LASF62:
	.ascii	"net_loop_state\000"
.LASF17:
	.ascii	"bank_offset\000"
.LASF40:
	.ascii	"next\000"
.LASF13:
	.ascii	"gpio_info\000"
	.ident	"GCC: (crosstool-NG 1.19.0) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
