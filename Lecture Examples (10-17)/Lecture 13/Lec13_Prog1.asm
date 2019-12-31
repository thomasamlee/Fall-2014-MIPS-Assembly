	.text
main:	la $t0,str		# pointer
	
loop:	lb $t1,0($t0)		# load byte
	beqz $t1,exit		# if byte = 0x00 (NULL), exit
	beq $t1,0x6c,count	# if byte = ox6c ("l"), add to count
incr:	add $t0,$t0,1		# else, increment pointer
	j loop
	
count:	add $t2,$t2,1		# increment "l" count
	j incr

exit:	la $a0,result		# print result string
	li $v0,4		# 4 = print string
	syscall

	move $a0,$t2		# move "l" count into a0
	li $v0,1		# 1 = print_int
	syscall
	
	li $v0,10		# 10 = end
	syscall

	.data
str:	.asciiz "hello world\n"
result:	.asciiz "The total count of the letter 'l' is " 
