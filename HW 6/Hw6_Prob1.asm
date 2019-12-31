	.text
main:	la $t0,w		# pointer in t0
	lw $t1,w		# word in t1
	li $t2,0		# counter in t2
	li $t3,0x89ab672f	# value in t3
	
loop:	beq $t2,4,exit		# if counter reaches 4, go to exit
	sw $t3,0($t0)		# store value in current address
	add $t0,$t0,4		# move to next address (add 4)
	lw $t1,0($t0)		# load word from new address
	add $t2,$t2,1		# increment counter
	j loop
	
exit:	li $v0,10
	syscall

	.data
w:	.word 0
x:	.word 0
y:	.word 0
z:	.word 0
