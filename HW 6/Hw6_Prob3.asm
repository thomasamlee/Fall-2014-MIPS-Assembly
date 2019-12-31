	.text
main:	li $t0,4	# counter in t0 (4 currently left to store). Will be used in reverse order to print.
	la $t1,num1	# address pointer
	
store:	lw $t2,0($t1)	# word in t2
	sw $t2,0($sp)	# load "bottom" of stack (1 to 4)
	
	sub $t0,$t0,1	# decrement counter (how many words left to store)
	beqz $t0,print	# if counter = 0, go to print loop
	add $t1,$t1,4	# next word address
	sub $sp,$sp,4	# move down stack (next address to fill)
	j store

print:	lw $a0,0($sp)	# print "top" of stack (4 to 1)
	li $v0,1
	syscall
	
	li $a0,0x0a	# print new line
	li $v0,11
	syscall
	
	add $t0,$t0,1	# increment counter (how many words printed)
	beq $t0,4,end	# if counter = 4, go to end
	add $sp,$sp,4	# move up the stack (next filled address) (end at original address)
	j print
	
end:	li $v0,10
	syscall

	.data
num1: 	.word 0x47
num2: 	.word 0xf8
num3: 	.word 0x3c
num4: 	.word 0xad