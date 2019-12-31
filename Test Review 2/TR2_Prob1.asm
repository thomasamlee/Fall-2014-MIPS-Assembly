		.text
main:	lw $t0,data1		# data1 in t0
		lw $t1,data2		# data2 in t1
		mul $a0, $t1, $t0	# data3 = data1 * data2
		sw $a0, data3		# data3 = 12998652
	
		li $v0,1		# 1 = print_int
		syscall
	
		li $v0, 10		# 10 = exit
		syscall

		.data
data1:	.word 7394
data2:	.word 1758
data3:	.word 0