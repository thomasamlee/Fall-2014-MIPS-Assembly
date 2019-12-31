		.text
		# address symbol method
main:	lw $t0, num1	# load num1 into register
		sw $t0, num3	# store num1 in num3

		# register contents plus offset method
		la $t2, num1	# load address of num1
		lw $t1, 4($t2)	# load the contents of num2's address (4 bytes from num1)
		sw $t1, 12($t2)	# store num2 address contents in num4 address location
		
		lw $a0, num3	# argument 1 = word output
		li $v0, 1		# function 1 = print_int
		syscall			# output num3
		
		li $a0, 0x0a	# load CR/LF into output register
		li $v0, 11		# function 11 = print new line
		syscall			# output new line
		
		lw $a0, 12($t2)	# argument 1 = word output (calling num4 address)
		li $v0, 1		# function 1 = print_int
		syscall
		
		li $v0, 10		# function 10 = end program
		syscall			# end



		.data
num1:	.word 35478
num2:	.word 98787
num3:	.word 0
num4:	.word 0