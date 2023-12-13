	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	li	a0,80
	call	malloc
	mv	s7,a0
	li	a0,80
	call	malloc
	mv	s6,a0
	li	a0,0
	call	time
	call	srand48
	call	pq_create
	mv	s4,a0
	mv	s2,s7
	mv	s1,s6
	addi	s5,s7,80
	mv	s3,s6
	mv	s0,s7
.L2:
	call	drand48
	fsd	fa0,0(s0)
	sd	s0,0(s3)
	addi	s0,s0,8
	addi	s3,s3,8
	bne	s0,s5,.L2
	li	a1,0
	li	a0,0
	call	m5_dump_reset_stats
	mv	s0,s6
.L3:
	ld	a1,0(s0)
	fld	fa0,0(s2)
	mv	a0,s4
	call	pq_push
	addi	s2,s2,8
	addi	s0,s0,8
	bne	s2,s5,.L3
	addi	s0,s6,80
.L4:
	mv	a0,s4
	call	pq_pop
	sd	a0,0(s1)
	addi	s1,s1,8
	bne	s1,s0,.L4
	li	a1,0
	li	a0,0
	call	m5_dump_reset_stats
	mv	a0,s4
	call	pq_destroy
	mv	a0,s7
	call	free
	mv	a0,s6
	call	free
	li	a0,0
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	ld	s1,56(sp)
	.cfi_restore 9
	ld	s2,48(sp)
	.cfi_restore 18
	ld	s3,40(sp)
	.cfi_restore 19
	ld	s4,32(sp)
	.cfi_restore 20
	ld	s5,24(sp)
	.cfi_restore 21
	ld	s6,16(sp)
	.cfi_restore 22
	ld	s7,8(sp)
	.cfi_restore 23
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
