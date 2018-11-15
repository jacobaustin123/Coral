	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_int_add                ## -- Begin function int_add
	.p2align	4, 0x90
_int_add:                               ## @int_add
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %ebp
	movq	(%rsi), %rax
	addl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	movq	%rax, (%rbx)
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_sub                ## -- Begin function int_sub
	.p2align	4, 0x90
_int_sub:                               ## @int_sub
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %ebp
	movq	(%rsi), %rax
	subl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	movq	%rax, (%rbx)
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_neq                ## -- Begin function int_neq
	.p2align	4, 0x90
_int_neq:                               ## @int_neq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %r14d
	movq	(%rsi), %rax
	movl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpl	%ebp, %r14d
	movq	%rax, (%rbx)
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	setne	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_greater            ## -- Begin function int_greater
	.p2align	4, 0x90
_int_greater:                           ## @int_greater
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %r14d
	movq	(%rsi), %rax
	movl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpl	%ebp, %r14d
	movq	%rax, (%rbx)
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	setg	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	movq	%rax, (%rbx)
	leaq	_ctype_int(%rip), %r14
	movq	%r14, 8(%rbx)
	movl	$1234342213, (%rax)     ## imm = 0x49929145
	movq	%rbx, _a(%rip)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	movq	%rax, (%rbx)
	movq	%r14, 8(%rbx)
	movl	$3342321, (%rax)        ## imm = 0x32FFF1
	movq	%rbx, _b(%rip)
	jmp	LBB4_1
	.p2align	4, 0x90
LBB4_4:                                 ## %else
                                        ##   in Loop: Header=BB4_1 Depth=1
	movq	_b(%rip), %rdi
	movq	_a(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*8(%rax)
	movq	%rax, _b(%rip)
LBB4_1:                                 ## %while
                                        ## =>This Inner Loop Header: Depth=1
	movq	_a(%rip), %rdi
	movq	_b(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*16(%rax)
	movq	(%rax), %rax
	cmpb	$1, (%rax)
	jne	LBB4_5
## %bb.2:                               ## %while_body
                                        ##   in Loop: Header=BB4_1 Depth=1
	movq	_a(%rip), %rdi
	movq	_b(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*24(%rax)
	movq	(%rax), %rax
	cmpb	$1, (%rax)
	jne	LBB4_4
## %bb.3:                               ## %then
                                        ##   in Loop: Header=BB4_1 Depth=1
	movq	_a(%rip), %rdi
	movq	_b(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*8(%rax)
	movq	%rax, _a(%rip)
	jmp	LBB4_1
LBB4_5:                                 ## %merge37
	movq	_a(%rip), %rax
	movq	(%rax), %rax
	movl	(%rax), %esi
	leaq	L_fmt(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_ctype_int              ## @ctype_int
	.p2align	4
_ctype_int:
	.quad	_int_add
	.quad	_int_sub
	.quad	_int_neq
	.quad	_int_greater

	.globl	_ctype_bool             ## @ctype_bool
.zerofill __DATA,__common,_ctype_bool,32,4
	.globl	_a                      ## @a
.zerofill __DATA,__common,_a,8,3
	.globl	_b                      ## @b
.zerofill __DATA,__common,_b,8,3
	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%g\n"


.subsections_via_symbols
