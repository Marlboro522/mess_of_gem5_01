	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"%g\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$10000, -44(%rbp)
	movl	-44(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movl	-44(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	$0, %edi
	call	time@PLT
	movq	%rax, %rdi
	call	srand48@PLT
	movl	$0, %eax
	call	pq_create@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L2
.L3:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	call	drand48@PLT
	movq	%xmm0, %rax
	movq	%rax, (%rbx)
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -48(%rbp)
.L2:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L3
	movl	$0, -48(%rbp)
	jmp	.L4
.L5:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	pq_push@PLT
	addl	$1, -48(%rbp)
.L4:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L5
	movl	$0, -48(%rbp)
	jmp	.L6
.L7:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	pq_pop@PLT
	movq	%rax, (%rbx)
	addl	$1, -48(%rbp)
.L6:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L7
	movl	$0, -48(%rbp)
	jmp	.L8
.L10:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L9
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L9:
	addl	$1, -48(%rbp)
.L8:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L10
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	pq_destroy@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
