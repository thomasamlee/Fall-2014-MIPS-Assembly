	.text
main:	li $t0,23
	li $t1,67
	li $t2,45
	
	blt $t0,$t1 comp02
	blt $t1,$t2,print1
	j print2
	
comp02:	blt $t0,$t2,print0
	j print2

print0:	move $a0,$t0
	j end

print1: move $a0,$t1	
	j end

print2:	move $a0,$t2

end:	li $v0,1	# 1 = print int
	syscall
	
	li $v0, 10	# 10 = exit
	syscall
