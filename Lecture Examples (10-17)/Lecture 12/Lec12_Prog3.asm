		.text
main:	lw $t0, A			# load A & save in D
		sw $t0, D
		
		lw $t0, B			# load B & save in D
		sw $t0, D
		
		la $t1, C			# load address of C
		lw $t0, 0($t1)		# load contents of address of C
		sw $t0, 4($t1)		# replace D (address of C + 4) with C
		
		lw $a0, D			# argument = word D
		li $v0, 1			# function 1 = print_int
		syscall				# should equal 42
		
		li $v0, 10			# function 10 = end program
		syscall				#end of main
											
		.data
A:		.word 57
B:		.word 23
C:		.word 42
D:		.word 0