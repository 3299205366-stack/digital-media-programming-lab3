	.build_version macos, 13, 0	sdk_version 27, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ## -- Begin function main
	.p2align	4
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -148(%rbp)
	movl	%edi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	cmpl	$1, -152(%rbp)
	jle	LBB0_2
## %bb.1:
	movq	-160(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_atoi
	movl	%eax, -208(%rbp)                ## 4-byte Spill
	jmp	LBB0_3
LBB0_2:
	movl	$1, %eax
	movl	%eax, -208(%rbp)                ## 4-byte Spill
	jmp	LBB0_3
LBB0_3:
	movl	-208(%rbp), %eax                ## 4-byte Reload
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	$2, -44(%rbp)
	movl	$3, -40(%rbp)
	movl	$4, -36(%rbp)
	movl	$5, -32(%rbp)
	movl	$6, -28(%rbp)
	movl	$7, -24(%rbp)
	movl	$8, -20(%rbp)
	movl	$9, -16(%rbp)
	leaq	-96(%rbp), %rdi
	leaq	l___const.main.b(%rip), %rsi
	movl	$36, %edx
	callq	_memcpy
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm0, -144(%rbp)
	movl	$0, -112(%rbp)
	movl	$6, %edi
	leaq	-184(%rbp), %rsi
	callq	_clock_gettime
	movl	$0, -204(%rbp)
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$2000000, -204(%rbp)            ## imm = 0x1E8480
	jge	LBB0_7
## %bb.5:                               ##   in Loop: Header=BB0_4 Depth=1
	leaq	-48(%rbp), %rdi
	leaq	-96(%rbp), %rsi
	leaq	-144(%rbp), %rdx
	callq	_matmul
## %bb.6:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	-204(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -204(%rbp)
	jmp	LBB0_4
LBB0_7:
	movl	$6, %edi
	leaq	-200(%rbp), %rsi
	callq	_clock_gettime
	leaq	L_.str(%rip), %rdi
	callq	_puts
	leaq	-144(%rbp), %rdi
	callq	_print_matrix
	movq	-184(%rbp), %rdi
	movq	-176(%rbp), %rsi
	movq	-200(%rbp), %rdx
	movq	-192(%rbp), %rcx
	callq	_elapsed_seconds
	leaq	L_.str.1(%rip), %rdi
	movl	$2000000, %esi                  ## imm = 0x1E8480
	movb	$1, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_9
## %bb.8:
	xorl	%eax, %eax
	addq	$208, %rsp
	popq	%rbp
	retq
LBB0_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.p2align	4                               ## -- Begin function matmul
_matmul:                                ## @matmul
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
                                        ##       Child Loop BB1_5 Depth 3
	cmpl	$3, -28(%rbp)
	jge	LBB1_12
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	$0, -32(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_5 Depth 3
	cmpl	$3, -32(%rbp)
	jge	LBB1_10
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=2
	movl	$0, -36(%rbp)
	movl	$0, -40(%rbp)
LBB1_5:                                 ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	$3, -40(%rbp)
	jge	LBB1_8
## %bb.6:                               ##   in Loop: Header=BB1_5 Depth=3
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	imulq	$12, %rcx, %rcx
	addq	%rcx, %rax
	movslq	-40(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-16(%rbp), %rcx
	movslq	-40(%rbp), %rdx
	imulq	$12, %rdx, %rdx
	addq	%rdx, %rcx
	movslq	-32(%rbp), %rdx
	imull	(%rcx,%rdx,4), %eax
	addl	-36(%rbp), %eax
	movl	%eax, -36(%rbp)
## %bb.7:                               ##   in Loop: Header=BB1_5 Depth=3
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB1_5
LBB1_8:                                 ##   in Loop: Header=BB1_3 Depth=2
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	imulq	$12, %rcx, %rcx
	addq	%rcx, %rax
	movslq	-32(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
## %bb.9:                               ##   in Loop: Header=BB1_3 Depth=2
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB1_3
LBB1_10:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_11
LBB1_11:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB1_1
LBB1_12:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4                               ## -- Begin function print_matrix
_print_matrix:                          ## @print_matrix
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	cmpl	$3, -12(%rbp)
	jge	LBB2_8
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	$0, -16(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$3, -16(%rbp)
	jge	LBB2_6
## %bb.4:                               ##   in Loop: Header=BB2_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	imulq	$12, %rcx, %rcx
	addq	%rcx, %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	movl	-16(%rbp), %ecx
	leaq	L_.str.4(%rip), %rdx
	leaq	L_.str.3(%rip), %rax
	cmpl	$2, %ecx
	cmoveq	%rax, %rdx
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
## %bb.5:                               ##   in Loop: Header=BB2_3 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB2_3
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_7
LBB2_7:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB2_1
LBB2_8:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ## -- Begin function elapsed_seconds
LCPI3_0:
	.quad	0x41cdcd6500000000              ## double 1.0E+9
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4
_elapsed_seconds:                       ## @elapsed_seconds
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -24(%rbp)
	movq	-32(%rbp), %rax
	subq	-16(%rbp), %rax
	cvtsi2sd	%rax, %xmm0
	movq	-24(%rbp), %rax
	subq	-8(%rbp), %rax
	cvtsi2sd	%rax, %xmm1
	movsd	LCPI3_0(%rip), %xmm2            ## xmm2 = [1.0E+9,0.0E+0]
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
	.p2align	4, 0x0                          ## @__const.main.b
l___const.main.b:
	.long	9                               ## 0x9
	.long	8                               ## 0x8
	.long	7                               ## 0x7
	.long	6                               ## 0x6
	.long	5                               ## 0x5
	.long	4                               ## 0x4
	.long	3                               ## 0x3
	.long	2                               ## 0x2
	.long	1                               ## 0x1

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"C result (3x3):"

L_.str.1:                               ## @.str.1
	.asciz	"iterations=%d elapsed=%.6f s\n"

L_.str.2:                               ## @.str.2
	.asciz	"%d%s"

L_.str.3:                               ## @.str.3
	.asciz	"\n"

L_.str.4:                               ## @.str.4
	.asciz	" "

.subsections_via_symbols
