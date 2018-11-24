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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_mul                ## -- Begin function int_mul
	.p2align	4, 0x90
_int_mul:                               ## @int_mul
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
	imull	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_div                ## -- Begin function int_div
	.p2align	4, 0x90
_int_div:                               ## @int_div
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
	movl	(%rax), %eax
	movq	(%rsi), %rcx
	cltd
	idivl	(%rcx)
	movl	%eax, %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_eq                 ## -- Begin function int_eq
	.p2align	4, 0x90
_int_eq:                                ## @int_eq
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	sete	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setne	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_lesser             ## -- Begin function int_lesser
	.p2align	4, 0x90
_int_lesser:                            ## @int_lesser
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setl	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_leq                ## -- Begin function int_leq
	.p2align	4, 0x90
_int_leq:                               ## @int_leq
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setle	(%rax)
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setg	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_geq                ## -- Begin function int_geq
	.p2align	4, 0x90
_int_geq:                               ## @int_geq
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
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setge	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_and                ## -- Begin function int_and
	.p2align	4, 0x90
_int_and:                               ## @int_and
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
	andl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_or                 ## -- Begin function int_or
	.p2align	4, 0x90
_int_or:                                ## @int_or
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
	orl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_neg                ## -- Begin function int_neg
	.p2align	4, 0x90
_int_neg:                               ## @int_neg
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	xorl	%ebp, %ebp
	subl	(%rax), %ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_int_not                ## -- Begin function int_not
	.p2align	4, 0x90
_int_not:                               ## @int_not
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %ebp
	notl	%ebp
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movl	%ebp, (%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_add              ## -- Begin function float_add
	.p2align	4, 0x90
_float_add:                             ## @float_add
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movq	(%rsi), %rax
	addsd	(%rax), %xmm0
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_sub              ## -- Begin function float_sub
	.p2align	4, 0x90
_float_sub:                             ## @float_sub
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movq	(%rsi), %rax
	subsd	(%rax), %xmm0
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_mul              ## -- Begin function float_mul
	.p2align	4, 0x90
_float_mul:                             ## @float_mul
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movq	(%rsi), %rax
	mulsd	(%rax), %xmm0
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_div              ## -- Begin function float_div
	.p2align	4, 0x90
_float_div:                             ## @float_div
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movq	(%rsi), %rax
	divsd	(%rax), %xmm0
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_eq               ## -- Begin function float_eq
	.p2align	4, 0x90
_float_eq:                              ## @float_eq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movq	(%rsi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rsp)           ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	ucomisd	(%rsp), %xmm0           ## 8-byte Folded Reload
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	sete	(%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_neq              ## -- Begin function float_neq
	.p2align	4, 0x90
_float_neq:                             ## @float_neq
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
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movq	(%rsi), %rax
	ucomisd	(%rax), %xmm0
	setp	%al
	setne	%bpl
	orb	%al, %bpl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	%bpl, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_lesser           ## -- Begin function float_lesser
	.p2align	4, 0x90
_float_lesser:                          ## @float_lesser
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movq	(%rsi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rsp)           ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	ucomisd	(%rsp), %xmm0           ## 8-byte Folded Reload
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setb	(%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_leq              ## -- Begin function float_leq
	.p2align	4, 0x90
_float_leq:                             ## @float_leq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movq	(%rsi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rsp)           ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	ucomisd	(%rsp), %xmm0           ## 8-byte Folded Reload
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setbe	(%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_greater          ## -- Begin function float_greater
	.p2align	4, 0x90
_float_greater:                         ## @float_greater
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movsd	(%rcx), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rsp)           ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	ucomisd	(%rsp), %xmm0           ## 8-byte Folded Reload
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setb	(%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_float_geq              ## -- Begin function float_geq
	.p2align	4, 0x90
_float_geq:                             ## @float_geq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movsd	(%rcx), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rsp)           ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	ucomisd	(%rsp), %xmm0           ## 8-byte Folded Reload
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setbe	(%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function float_neg
LCPI24_0:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_float_neg
	.p2align	4, 0x90
_float_neg:                             ## @float_neg
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	xorps	LCPI24_0(%rip), %xmm0
	movaps	%xmm0, (%rsp)           ## 16-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movaps	(%rsp), %xmm0           ## 16-byte Reload
	movlps	%xmm0, (%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function float_not
LCPI25_0:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_float_not
	.p2align	4, 0x90
_float_not:                             ## @float_not
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movq	(%rdi), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	xorps	LCPI25_0(%rip), %xmm0
	movaps	%xmm0, (%rsp)           ## 16-byte Spill
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movaps	(%rsp), %xmm0           ## 16-byte Reload
	movlps	%xmm0, (%rax)
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_eq                ## -- Begin function bool_eq
	.p2align	4, 0x90
_bool_eq:                               ## @bool_eq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movb	(%rcx), %bl
	xorb	(%rax), %bl
	notb	%bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_neq               ## -- Begin function bool_neq
	.p2align	4, 0x90
_bool_neq:                              ## @bool_neq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movb	(%rcx), %bl
	xorb	(%rax), %bl
	notb	%bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_lesser            ## -- Begin function bool_lesser
	.p2align	4, 0x90
_bool_lesser:                           ## @bool_lesser
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movb	(%rcx), %bl
	notb	%bl
	andb	(%rax), %bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_leq               ## -- Begin function bool_leq
	.p2align	4, 0x90
_bool_leq:                              ## @bool_leq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movb	(%rcx), %bl
	notb	%bl
	orb	(%rax), %bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_greater           ## -- Begin function bool_greater
	.p2align	4, 0x90
_bool_greater:                          ## @bool_greater
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movb	(%rax), %bl
	movq	(%rsi), %rax
	notb	%bl
	andb	(%rax), %bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_geq               ## -- Begin function bool_geq
	.p2align	4, 0x90
_bool_geq:                              ## @bool_geq
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movb	(%rax), %bl
	movq	(%rsi), %rax
	notb	%bl
	orb	(%rax), %bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_and               ## -- Begin function bool_and
	.p2align	4, 0x90
_bool_and:                              ## @bool_and
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movb	(%rcx), %bl
	andb	(%rax), %bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_or                ## -- Begin function bool_or
	.p2align	4, 0x90
_bool_or:                               ## @bool_or
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rdi), %rax
	movq	(%rsi), %rcx
	movb	(%rcx), %bl
	orb	(%rax), %bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_neg               ## -- Begin function bool_neg
	.p2align	4, 0x90
_bool_neg:                              ## @bool_neg
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	movb	(%rax), %bpl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	%bpl, (%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bool_not               ## -- Begin function bool_not
	.p2align	4, 0x90
_bool_not:                              ## @bool_not
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
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	movb	(%rax), %bl
	notb	%bl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	andb	$1, %bl
	movb	%bl, (%rax)
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_eq                ## -- Begin function char_eq
	.p2align	4, 0x90
_char_eq:                               ## @char_eq
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	movb	(%rax), %r14b
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpb	%r14b, %bpl
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	sete	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_neq               ## -- Begin function char_neq
	.p2align	4, 0x90
_char_neq:                              ## @char_neq
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	movb	(%rax), %r14b
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpb	%r14b, %bpl
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	sete	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_lesser            ## -- Begin function char_lesser
	.p2align	4, 0x90
_char_lesser:                           ## @char_lesser
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	movb	(%rax), %r14b
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpb	%r14b, %bpl
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setl	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_leq               ## -- Begin function char_leq
	.p2align	4, 0x90
_char_leq:                              ## @char_leq
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	movb	(%rax), %r14b
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpb	%r14b, %bpl
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setle	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_greater           ## -- Begin function char_greater
	.p2align	4, 0x90
_char_greater:                          ## @char_greater
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	movb	(%rax), %r14b
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpb	%r14b, %bpl
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setg	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_geq               ## -- Begin function char_geq
	.p2align	4, 0x90
_char_geq:                              ## @char_geq
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	movb	(%rax), %r14b
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	cmpb	%r14b, %bpl
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	setge	(%rax)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_and               ## -- Begin function char_and
	.p2align	4, 0x90
_char_and:                              ## @char_and
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	addb	(%rax), %bpl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	%bpl, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_or                ## -- Begin function char_or
	.p2align	4, 0x90
_char_or:                               ## @char_or
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
	movb	(%rax), %bpl
	movq	(%rsi), %rax
	orb	(%rax), %bpl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	%bpl, (%rax)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_neg               ## -- Begin function char_neg
	.p2align	4, 0x90
_char_neg:                              ## @char_neg
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	xorl	%ebp, %ebp
	subb	(%rax), %bpl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	%bpl, (%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_char_not               ## -- Begin function char_not
	.p2align	4, 0x90
_char_not:                              ## @char_not
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	movb	(%rax), %bpl
	notb	%bpl
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$1, %edi
	callq	_malloc
	leaq	_ctype_int(%rip), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	%bpl, (%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
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
	leaq	_ctype_int(%rip), %r14
	movq	%r14, 8(%rbx)
	movq	%rax, (%rbx)
	movl	$1234342213, (%rax)     ## imm = 0x49929145
	movq	%rbx, _a(%rip)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$4, %edi
	callq	_malloc
	movq	%r14, 8(%rbx)
	movq	%rax, (%rbx)
	movl	$334232, (%rax)         ## imm = 0x51998
	movq	%rbx, _b(%rip)
	jmp	LBB46_1
	.p2align	4, 0x90
LBB46_4:                                ## %else
                                        ##   in Loop: Header=BB46_1 Depth=1
	movq	_b(%rip), %rdi
	movq	_a(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*8(%rax)
	movq	%rax, _b(%rip)
LBB46_1:                                ## %while
                                        ## =>This Inner Loop Header: Depth=1
	movq	_a(%rip), %rdi
	movq	_b(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*48(%rax)
	movq	(%rax), %rax
	cmpb	$1, (%rax)
	jne	LBB46_5
## %bb.2:                               ## %while_body
                                        ##   in Loop: Header=BB46_1 Depth=1
	movq	_a(%rip), %rdi
	movq	_b(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*72(%rax)
	movq	(%rax), %rax
	cmpb	$1, (%rax)
	jne	LBB46_4
## %bb.3:                               ## %then
                                        ##   in Loop: Header=BB46_1 Depth=1
	movq	_a(%rip), %rdi
	movq	_b(%rip), %rsi
	movq	8(%rdi), %rax
	callq	*8(%rax)
	movq	%rax, _a(%rip)
	jmp	LBB46_1
LBB46_5:                                ## %merge37
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
	.quad	_int_mul
	.quad	_int_div
	.quad	0
	.quad	_int_eq
	.quad	_int_neq
	.quad	_int_lesser
	.quad	_int_leq
	.quad	_int_greater
	.quad	_int_geq
	.quad	_int_and
	.quad	_int_or
	.quad	_int_neg
	.quad	_int_not

	.globl	_ctype_float            ## @ctype_float
	.p2align	4
_ctype_float:
	.quad	_float_add
	.quad	_float_sub
	.quad	_float_mul
	.quad	_float_div
	.quad	0
	.quad	_float_eq
	.quad	_float_neq
	.quad	_float_lesser
	.quad	_float_leq
	.quad	_float_greater
	.quad	_float_geq
	.quad	0
	.quad	0
	.quad	_float_neg
	.quad	_float_not

	.globl	_ctype_bool             ## @ctype_bool
	.p2align	4
_ctype_bool:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_bool_eq
	.quad	_bool_neq
	.quad	_bool_lesser
	.quad	_bool_leq
	.quad	_bool_greater
	.quad	_bool_geq
	.quad	_bool_and
	.quad	_bool_or
	.quad	_bool_neg
	.quad	_bool_not

	.globl	_ctype_char             ## @ctype_char
	.p2align	4
_ctype_char:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_char_eq
	.quad	_char_neq
	.quad	_char_lesser
	.quad	_char_leq
	.quad	_char_greater
	.quad	_char_geq
	.quad	_char_and
	.quad	_char_or
	.quad	_char_neg
	.quad	_char_not

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
