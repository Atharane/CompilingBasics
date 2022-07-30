	.file	"mark.c"
	.text
	.globl	_int_a
	.bss
	.align 4
_int_a:
	.space 4
	.comm	_long_a, 4, 2
	.comm	_long_sum, 4, 2
	.comm	_float_a, 4, 2
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "lorem ipsum\0"
LC1:
	.ascii "Numbers: \0"
LC2:
	.ascii "%ld %f\0"
LC3:
	.ascii "Sum: %ld \12\12\0"
LC4:
	.ascii "*debug* A = %d\12\12\0"
LC5:
	.ascii "New A:  %d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_printf
	movl	$_float_a, 8(%esp)
	movl	$_long_a, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	_long_a, %eax
	movl	%eax, 20(%esp)
	fildl	20(%esp)
	flds	_float_a
	faddp	%st, %st(1)
	fnstcw	30(%esp)
	movzwl	30(%esp), %eax
	orb	$12, %ah
	movw	%ax, 28(%esp)
	fldcw	28(%esp)
	fistpl	24(%esp)
	fldcw	30(%esp)
	movl	24(%esp), %eax
	movl	%eax, _long_sum
	movl	_long_sum, %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	_long_sum, %eax
	addl	$10, %eax
	movl	%eax, _long_sum
	movl	_int_a, %eax
	addl	$20, %eax
	movl	%eax, _int_a
	movl	_int_a, %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	_int_a, %eax
	addl	$20, %eax
	movl	%eax, _int_a
	movl	_int_a, %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
