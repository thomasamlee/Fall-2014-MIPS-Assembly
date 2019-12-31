		.text
main:		la $a0,str			# output hello world
		li $v0,4			# 4 = print_string
		syscall
		
		lw $t1,data1		# data1 in t1
		lw $t2,data2		# data2 in t2
		lw $t3,data3		# data3 in t3
		lw $t4,data4		# data4 in t4
		lw $t5,data5		# data5 in t5
		
		sub $t0,$t1,$t2		# ans = data1 - data2
		add $t0,$t0,$t3		# ans + data3
		div $t0,$t0,$t4		# ans / data4
		mul $t0,$t0,$t5		# ans * data5
		sw $t0,ans			# store t0 in ans
		
		move $a0,$t0		# ans = 0
		li $v0,1			# 1 = print_int
		syscall
		
		li $v0,10			# funct 10 = exit
		syscall
		
		.data
str:	.asciiz "Hello, world!\n"
data1:	.word 51
data2:	.word 37
data3:	.word 26
data4:	.word 49
data5:	.word 80
ans:	.word 0
