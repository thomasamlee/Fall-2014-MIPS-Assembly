		.text
main:	lw $t0,t			# t in t1
		lw $t1,u			# u in t1
		lw $t2,v			# v in t3
		lw $t3,w			# w in t4
		
		sub $t4,$t0,$t1		# t - u in t4
		sw	$t4,x			# store t - u in x 		
		
		sub $t5,$t2,$t3		# v - w in t5
		sw $t5,y			# store v - w in y
		
		mul $t6,$t5,$t4		# x * y in t6
		sw $t6,z			# store x * y in z
	
		move $a0,$t6		# z = 644
		li $v0,1			# 1 = print_int
		syscall				
		
		li $v0,10			# 10 = exit
		syscall
		
		.data
t:		.word 100
u:		.word 54
v:		.word 37
w:		.word 23
x:		.word 0
y:		.word 0
z:		.word 0