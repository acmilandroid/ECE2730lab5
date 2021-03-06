# Basil Lin
# Section 002
# Lab 5
# Purpose - translate C programs to assembly, learn to use conditionals
#			in assembly language
/* begin assembly stub */

.globl Fib
.type Fib, @function
Fib:
	/* prolog */
	pushl %ebp #writes to stack
	pushl %ebx #writes to stack
	movl %esp, %ebp #moves registers
	subl $8, %esp
	/* put code here */
	movl global_var, %eax
	movl $0, %ebx
	movl %eax, -4(%ebp)
	cmp $0, -4(%ebp)
	je return
	cmp $1, -4(%ebp)
	je return
	movl -4(%ebp), %eax
	subl $1, %eax
	movl %eax, global_var
	call Fib
	movl global_var, %eax
	movl %eax, -8(%ebp)
	movl -4(%ebp), %eax
	subl $2, %eax
	movl %eax, global_var
	call Fib
	movl global_var, %eax
	movl -8(%ebp), %ebx
	addl %eax, %ebx
	incl %eax
	movl %ebx, global_var
	jmp return
	return:
		/* epilog */
		movl %ebp, %esp
		popl %ebx
		popl %ebp
		ret

