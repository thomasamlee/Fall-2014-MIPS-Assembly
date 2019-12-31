	.text
main:	la $t0,num1		# pointer in t0, counter in t1, current word in t2
	
loop:	lw $t2,0($t0)		# current word in t2
	sw $t2,0($sp)		# store word in stack
	add $t1,$t1,1		# increment counter
	beq $t1,4,print		# if 4 words have been stored, print
	add $t0,$t0,4		# next pointer address
	sub $sp,$sp,4		# decrement stack pointer
	j loop
	
print:	lw $a0,0($sp)		# print word
	li $v0,1		# 1 = print int
	syscall
	
	la $a0,0x0a		# print carriage return	
	li $v0,11
	syscall
	
	add $sp,$sp,4		# re-increment stack pointer
	sub $t1,$t1,1		# decrement counter (4,3,2,1)
	bgt $t1,0,print		# if 0 words left to print, exit
	
exit: 	li $v0,10		# 10 = exit
	syscall

	# 19 lines
	
	.data
num1:	.word 34527
num2:	.word 98564
num3:	.word 12953
num4:	.word 68577
