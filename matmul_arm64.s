	.build_version macos, 26, 0	sdk_version 27, 0
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI0_0:
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.long	4                               ; 0x4
	.long	5                               ; 0x5
lCPI0_1:
	.long	6                               ; 0x6
	.long	7                               ; 0x7
	.long	8                               ; 0x8
	.long	9                               ; 0x9
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #176
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	cmp	w0, #2
	b.lt	LBB0_2
; %bb.1:
	ldr	x0, [x1, #8]
	bl	_atoi
	b	LBB0_3
LBB0_2:
	mov	w0, #1                          ; =0x1
LBB0_3:
	mov	w20, #33920                     ; =0x8480
	movk	w20, #30, lsl #16
	stur	w0, [x29, #-76]
Lloh3:
	adrp	x8, lCPI0_0@PAGE
Lloh4:
	ldr	q0, [x8, lCPI0_0@PAGEOFF]
	stur	q0, [x29, #-72]
Lloh5:
	adrp	x8, lCPI0_1@PAGE
Lloh6:
	ldr	q0, [x8, lCPI0_1@PAGEOFF]
	stur	q0, [x29, #-56]
	str	wzr, [sp, #80]
	movi.2d	v0, #0000000000000000
	str	q0, [sp, #64]
	str	q0, [sp, #48]
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
Lloh7:
	adrp	x19, l___const.main.b@PAGE
Lloh8:
	add	x19, x19, l___const.main.b@PAGEOFF
	mov	w21, #33920                     ; =0x8480
	movk	w21, #30, lsl #16
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	sub	x0, x29, #76
	add	x2, sp, #48
	mov	x1, x19
	bl	_matmul
	subs	w21, w21, #1
	b.ne	LBB0_4
; %bb.5:
	add	x1, sp, #16
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
Lloh9:
	adrp	x0, l_.str@PAGE
Lloh10:
	add	x0, x0, l_.str@PAGEOFF
	bl	_puts
	ldr	w8, [sp, #48]
Lloh11:
	adrp	x21, l_.str.4@PAGE
Lloh12:
	add	x21, x21, l_.str.4@PAGEOFF
	stp	x8, x21, [sp]
Lloh13:
	adrp	x19, l_.str.2@PAGE
Lloh14:
	add	x19, x19, l_.str.2@PAGEOFF
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #52]
	stp	x8, x21, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #56]
Lloh15:
	adrp	x22, l_.str.3@PAGE
Lloh16:
	add	x22, x22, l_.str.3@PAGEOFF
	stp	x8, x22, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #60]
	stp	x8, x21, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #64]
	stp	x8, x21, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #68]
	stp	x8, x22, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #72]
	stp	x8, x21, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #76]
	stp	x8, x21, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #80]
	stp	x8, x22, [sp]
	mov	x0, x19
	bl	_printf
	ldp	x8, x9, [sp, #32]
	ldp	x10, x11, [sp, #16]
	sub	x8, x10, x8
	scvtf	d0, x8
	sub	x8, x11, x9
	scvtf	d1, x8
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d2, x8
	fdiv	d1, d1, d2
	fadd	d0, d1, d0
	str	x20, [sp]
	str	d0, [sp, #8]
Lloh17:
	adrp	x0, l_.str.1@PAGE
Lloh18:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-40]
Lloh19:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh20:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh21:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_7
; %bb.6:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB0_7:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpLdr	Lloh5, Lloh6
	.loh AdrpAdrp	Lloh3, Lloh5
	.loh AdrpLdr	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh19, Lloh20, Lloh21
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpAdd	Lloh9, Lloh10
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function matmul
_matmul:                                ; @matmul
	.cfi_startproc
; %bb.0:
	ldr	w8, [x1]
	ldp	w9, w10, [x0]
	mul	w8, w8, w9
	ldr	w9, [x1, #12]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #8]
	ldr	w10, [x1, #24]
	madd	w8, w10, w9, w8
	str	w8, [x2]
	ldr	w8, [x1, #4]
	ldp	w9, w10, [x0]
	mul	w8, w8, w9
	ldr	w9, [x1, #16]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #8]
	ldr	w10, [x1, #28]
	madd	w8, w10, w9, w8
	str	w8, [x2, #4]
	ldr	w8, [x1, #8]
	ldp	w9, w10, [x0]
	mul	w8, w8, w9
	ldr	w9, [x1, #20]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #8]
	ldr	w10, [x1, #32]
	madd	w8, w10, w9, w8
	str	w8, [x2, #8]
	ldr	w8, [x1]
	ldp	w9, w10, [x0, #12]
	mul	w8, w8, w9
	ldr	w9, [x1, #12]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #20]
	ldr	w10, [x1, #24]
	madd	w8, w10, w9, w8
	str	w8, [x2, #12]
	ldr	w8, [x1, #4]
	ldp	w9, w10, [x0, #12]
	mul	w8, w8, w9
	ldr	w9, [x1, #16]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #20]
	ldr	w10, [x1, #28]
	madd	w8, w10, w9, w8
	str	w8, [x2, #16]
	ldr	w8, [x1, #8]
	ldp	w9, w10, [x0, #12]
	mul	w8, w8, w9
	ldr	w9, [x1, #20]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #20]
	ldr	w10, [x1, #32]
	madd	w8, w10, w9, w8
	str	w8, [x2, #20]
	ldr	w8, [x1]
	ldp	w9, w10, [x0, #24]
	mul	w8, w8, w9
	ldr	w9, [x1, #12]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #32]
	ldr	w10, [x1, #24]
	madd	w8, w10, w9, w8
	str	w8, [x2, #24]
	ldr	w8, [x1, #4]
	ldp	w9, w10, [x0, #24]
	mul	w8, w8, w9
	ldr	w9, [x1, #16]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #32]
	ldr	w10, [x1, #28]
	madd	w8, w10, w9, w8
	str	w8, [x2, #28]
	ldr	w8, [x1, #8]
	ldp	w9, w10, [x0, #24]
	mul	w8, w8, w9
	ldr	w9, [x1, #20]
	madd	w8, w9, w10, w8
	ldr	w9, [x0, #32]
	ldr	w10, [x1, #32]
	madd	w8, w10, w9, w8
	str	w8, [x2, #32]
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @__const.main.b
l___const.main.b:
	.long	9                               ; 0x9
	.long	8                               ; 0x8
	.long	7                               ; 0x7
	.long	6                               ; 0x6
	.long	5                               ; 0x5
	.long	4                               ; 0x4
	.long	3                               ; 0x3
	.long	2                               ; 0x2
	.long	1                               ; 0x1

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"C result (3x3):"

l_.str.1:                               ; @.str.1
	.asciz	"iterations=%d elapsed=%.6f s\n"

l_.str.2:                               ; @.str.2
	.asciz	"%d%s"

l_.str.3:                               ; @.str.3
	.asciz	"\n"

l_.str.4:                               ; @.str.4
	.asciz	" "

.subsections_via_symbols
