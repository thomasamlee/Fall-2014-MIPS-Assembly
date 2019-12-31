		.text
main:	li $t3, 50			# 50 in t3
		li $t4, 72			# 72 in t4
		li $t5, 39			# 39 in t5
		
		mul $t0, $t3, $t4	# t3 x t4 in t0
		mul $t1, $t4, $t5	# t4 x t5 in t1
		
		sub $a0, $t0, $t1	# t0 - t1 = 792
		li $v0, 1			# 1 = print_int
		syscall				
		
		li $a0, 0x0a		# 0x0a = new line
		li $v0, 11			# 11 = line feed
		syscall		 		
		
		move $a0, $t0		# t0 = 3600
		li $v0, 1			# 1 =  print_int
		syscall				
		
		li $a0, 0x0a		# 0x0a = new line
		li $v0, 11			# 11 = line feed
		syscall				
		
		move $a0, $t1		# t1 = 2808
		li $v0, 1			# 1 =  print_int
		syscall				
		
		li $v0, 10			# 10 = exit
		syscall	