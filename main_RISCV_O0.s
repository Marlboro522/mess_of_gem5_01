	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%g\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-80(s0)
	sw	a5,-68(s0)
	li	a5,8192
	addi	a5,a5,1808
	sw	a5,-40(s0)
	lw	a5,-40(s0)
	slli	a5,a5,3
	mv	a0,a5
	call	malloc
	mv	a5,a0
	sd	a5,-48(s0)
	lw	a5,-40(s0)
	slli	a5,a5,3
	mv	a0,a5
	call	malloc
	mv	a5,a0
	sd	a5,-56(s0)
	li	a0,0
	call	time
	mv	a5,a0
	mv	a0,a5
	call	srand48
	call	pq_create
	sd	a0,-64(s0)
	sw	zero,-36(s0)
	j	.L2
.L3:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-48(s0)
	add	s1,a4,a5
	call	drand48
	fmv.d	fa5,fa0
	fsd	fa5,0(s1)
	lw	a5,-36(s0)
	slli	a4,a5,3
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a3,-56(s0)
	add	a5,a3,a5
	ld	a3,-48(s0)
	add	a4,a3,a4
	sd	a4,0(a5)
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L2:
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L3
	sw	zero,-36(s0)
	j	.L4
.L5:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-48(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a1,a5
	fmv.d	fa0,fa5
	ld	a0,-64(s0)
	call	pq_push
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L4:
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L5
	sw	zero,-36(s0)
	j	.L6
.L7:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	s1,a4,a5
	ld	a0,-64(s0)
	call	pq_pop
	mv	a5,a0
	sd	a5,0(s1)
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L6:
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L7
	sw	zero,-36(s0)
	j	.L8
.L10:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	beq	a5,zero,.L9
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	fld	fa5,0(a5)
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
.L9:
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L8:
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L10
	ld	a0,-64(s0)
	call	pq_destroy
	ld	a0,-48(s0)
	call	free
	ld	a0,-56(s0)
	call	free
	li	a5,0
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	ld	s1,56(sp)
	.cfi_restore 9
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
