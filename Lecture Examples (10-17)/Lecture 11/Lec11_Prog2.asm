		.text
main:	la $a0, str			#output string
		li $v0, 4
		syscall
		
		li $t0, 7			#x = 7
		mul $t0, $t0, $t0	#x^2
		mul $t0, $t0, 5		#5X^2
		sub	$t0, $t0, 3		#5X^2 - 3
		
		
		# end
		li $v0, 10
		syscall
		
		.data
str:	.asciiz "The answer is "