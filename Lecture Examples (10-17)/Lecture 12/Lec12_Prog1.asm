		.text
main:	li $v0, 5		#function 5 = read_int
		syscall			#user input number
		
		move $a0, $v0	#move user input into ouput register
		li $v0, 1		#function 1 = print_int
		syscall			#ouput user int
		
		li $a0, 0x0a	#load CR/LF into output register
		li $v0, 11		#function 11 = print new line
		syscall			#output clear line
		
		la $a0, buffer	#argument 1: size of buffer
		li $a1, 18		#argument 2: length of string
		li $v0, 8		#function 8 = read_string
		syscall			#user input string
		
		la $a0, buffer	#load user input into output register
		li $v0, 4		#function 4 = print_string
		syscall			#output user string
		
		li $v0, 10		#function 10 = end program
		syscall			# end
		
		.data
buffer:	.space 20		#size of buffer given here