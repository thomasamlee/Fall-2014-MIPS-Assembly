# $t0 = current pointer
# $t1 = comparison pointer
# $t2 = stack pointer
# $t3 = current word
# $t4 = comparison word
				
	.data
nums:	.word 5,3,8,9,2,4,1,7,6	
	.text
main:	la $t0,nums		# t0 = current pointer
	la $t1,nums		# t1 = comparison pointer
	move $t2,$sp		# t2 = stack pointer
	li $v0,1		# 1 = print int

comp:	lw $t3,0($t0)		# t3 = current word (initial = 1st word)
	beqz $t3,prnt0		# if current word is 0, print
	lw $t4,0($t1)		# t4 = comparison word	(initial = 1st word)
	beqz $t4,newword	# if comparison word is 0, push current word onto stack
	ble,$t3,$t4,nxtcmp	# if current word is greater, store lower on stack
	sub $t2,$t2,4		# decrement stack
nxtcmp:	add $t1,$t1,4		# else, new comparison word
	j comp
	
newword:sw $t3,($t2)		# push word onto stack
	add $t0,$t0,4		# move current pointer to next current address
	la $t1,nums		# reset comparison pointer
	move $t2,$sp		# reset stack pointer
	j comp		
	
prnt0:	move $t2,$sp		# print from beginning of stack, downward
print:	lw $a0,0($t2)		# load word
	beqz $a0,exit		# if word = 0, exit
	syscall			# output = 123456789
	sub $t2,$t2,4		# next word
	j print

exit:	li $v0,10
	syscall

# 25 lines vs Dodge's 37
