	.text
main:	lw $t1,x
	lw $t2,y
	
loop:	sub $t2,$t2,1
	beqz $t2,done
	mul $t1,$t1,100
	j loop
	
done:	sw $t1,z
	lw $a0,z
	li $v0,1
	syscall
	li $v0,10
	syscall

	.data
x:	.word 100
y:	.word 4
z:	.space 4