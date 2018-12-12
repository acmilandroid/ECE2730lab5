# Basil Lin
# Section 002
# Lab 5
# Purpose - create Fibonacci sequence. Learn to use push, pop, and call functions in 
#			assembly language.
#
/* begin assembly stub */

.globl Fib
.type Fib, @function
Fib:
	/* prolog */
	pushl %ebp 				#writes to stack
	pushl %ebx 				#writes to stack
	movl %esp, %ebp			#moves registers
	subl $8, %esp

	/* put code here */
	movl global_var, %eax
	movl %eax, -4(%ebp)		#moves global_var to local_var
	cmp $0, %eax 			#if(local_var == 0) return;
	je return 				#jump to return
	cmp $1, %eax 			#if(local_var == 1) return;
	je return 				#jump to return
	subl $1, %eax 			#local_var - 1
	movl %eax, global_var 	#moves local_var to global_var
	call Fib 				#calls Fib function
	movl global_var, %eax
	movl %eax, -8(%ebp) 	#moves global_var to temp_var
	movl -4(%ebp), %eax
	subl $2, %eax 
	movl %eax, global_var 	#subtracts 2 from local_var and moves it to global_var
	call Fib 				#calls Fib function
	movl global_var, %eax
	movl -8(%ebp), %ebx
	addl %eax, %ebx 		#adds temp_var and global_var
	movl %ebx, global_var	#moves temp_var to global_var
	jmp return
	return:					#return function
		/* epilog */
		movl %ebp, %esp		#moves registers
		popl %ebx			#copies stack
		popl %ebp			#copies stack
		ret

