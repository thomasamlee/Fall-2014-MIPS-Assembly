		.text
main: 	lw $t0,aa			# load aa, bb, & cc
		lw $t1,bb
		lw $t2,cc
		
		mul $t0,$t0,$t0		# square aa
		sw $t0,dd		# store in dd
		
		mul $t1,$t1,$t1		# square bb
		sw $t1,ee		# store in ee
		
		mul $t2,$t2,$t2		# square cc
		sw $t2,ff		# store in ff
		
		sub $t3,$t0,$t1		# (aa^2) - (bb^2)
		sub $t3,$t3,$t2		# (aa^2) - (bb^2) - (cc^2)
		
		move $a0,$t3		# output 22788
		li $v0,1		# 1 = print_int
		syscall
		
		li $v0,10		# 10 = exit
		syscall
		
		.data
aa:		.word 159
bb:		.word 27
cc:		.word 42
dd:		.word 0
ee:		.word 0
ff:		.word 0
