	.build_version macos, 13, 0	sdk_version 27, 0
	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ## -- Begin function main
LCPI0_0:
	.long	2                               ## 0x2
	.long	3                               ## 0x3
	.long	4                               ## 0x4
	.long	5                               ## 0x5
LCPI0_1:
	.long	6                               ## 0x6
	.long	7                               ## 0x7
	.long	8                               ## 0x8
	.long	9                               ## 0x9
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0
LCPI0_2:
	.quad	0x41cdcd6500000000              ## double 1.0E+9
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$128, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movl	$1, %eax
	cmpl	$2, %edi
	jl	LBB0_2
## %bb.1:
	movq	8(%rsi), %rdi
	callq	_atoi
LBB0_2:
	movl	%eax, -80(%rbp)
	movaps	LCPI0_0(%rip), %xmm0            ## xmm0 = [2,3,4,5]
	movups	%xmm0, -76(%rbp)
	movaps	LCPI0_1(%rip), %xmm0            ## xmm0 = [6,7,8,9]
	movups	%xmm0, -60(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -112(%rbp)
	movaps	%xmm0, -128(%rbp)
	movl	$0, -96(%rbp)
	leaq	-160(%rbp), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	movl	$2000000, %r12d                 ## imm = 0x1E8480
	leaq	l___const.main.b(%rip), %rbx
	leaq	-80(%rbp), %r14
	leaq	-128(%rbp), %r15
	.p2align	4
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_matmul
	decl	%r12d
	jne	LBB0_3
## %bb.4:
	leaq	-144(%rbp), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	leaq	L_.str(%rip), %rdi
	callq	_puts
	movl	-128(%rbp), %esi
	leaq	L_.str.2(%rip), %rbx
	leaq	L_.str.4(%rip), %r14
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-124(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-120(%rbp), %esi
	leaq	L_.str.3(%rip), %r15
	movq	%rbx, %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-116(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-112(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-108(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-104(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-100(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%eax, %eax
	callq	_printf
	movl	-96(%rbp), %esi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_printf
	movq	-144(%rbp), %rax
	movq	-136(%rbp), %rcx
	subq	-160(%rbp), %rax
	cvtsi2sd	%rax, %xmm1
	subq	-152(%rbp), %rcx
	cvtsi2sd	%rcx, %xmm0
	divsd	LCPI0_2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	leaq	L_.str.1(%rip), %rdi
	movl	$2000000, %esi                  ## imm = 0x1E8480
	movb	$1, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB0_6
## %bb.5:
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_6:
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
	movl	(%rsi), %eax
	movl	12(%rsi), %ecx
	imull	(%rdi), %eax
	imull	4(%rdi), %ecx
	addl	%eax, %ecx
	movl	24(%rsi), %eax
	imull	8(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	movl	4(%rsi), %eax
	movl	16(%rsi), %ecx
	imull	(%rdi), %eax
	imull	4(%rdi), %ecx
	addl	%eax, %ecx
	movl	28(%rsi), %eax
	imull	8(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 4(%rdx)
	movl	8(%rsi), %eax
	movl	20(%rsi), %ecx
	imull	(%rdi), %eax
	imull	4(%rdi), %ecx
	addl	%eax, %ecx
	movl	32(%rsi), %eax
	imull	8(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 8(%rdx)
	movl	(%rsi), %eax
	movl	12(%rsi), %ecx
	imull	12(%rdi), %eax
	imull	16(%rdi), %ecx
	addl	%eax, %ecx
	movl	24(%rsi), %eax
	imull	20(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 12(%rdx)
	movl	4(%rsi), %eax
	movl	16(%rsi), %ecx
	imull	12(%rdi), %eax
	imull	16(%rdi), %ecx
	addl	%eax, %ecx
	movl	28(%rsi), %eax
	imull	20(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 16(%rdx)
	movl	8(%rsi), %eax
	movl	20(%rsi), %ecx
	imull	12(%rdi), %eax
	imull	16(%rdi), %ecx
	addl	%eax, %ecx
	movl	32(%rsi), %eax
	imull	20(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 20(%rdx)
	movl	(%rsi), %eax
	movl	12(%rsi), %ecx
	imull	24(%rdi), %eax
	imull	28(%rdi), %ecx
	addl	%eax, %ecx
	movl	24(%rsi), %eax
	imull	32(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 24(%rdx)
	movl	4(%rsi), %eax
	movl	16(%rsi), %ecx
	imull	24(%rdi), %eax
	imull	28(%rdi), %ecx
	addl	%eax, %ecx
	movl	28(%rsi), %eax
	imull	32(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 28(%rdx)
	movl	8(%rsi), %eax
	movl	20(%rsi), %ecx
	imull	24(%rdi), %eax
	imull	28(%rdi), %ecx
	addl	%eax, %ecx
	movl	32(%rsi), %eax
	imull	32(%rdi), %eax
	addl	%ecx, %eax
	movl	%eax, 32(%rdx)
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
