	.text
main:	la $t0,str		# pointer in t0
	
loop1:	lb $t1,0($t0)		# byte in t1
	beqz $t1,print		# if byte is null, go to print
	bge $t1,0x61,loop2	# if byte is greater than or equal to 0x61, go to loop2
	j incr			# else, just increment

loop2:	ble $t1,0x7a,upper	# if byte less than or equal to 0x7a, go to upper
	j incr			# else, just increment
	
upper:	sub $t1,$t1,0x20	# subtract 0x20 from byte to capitalize
	sb $t1,0($t0)		# store byte back into adress
				
incr:	add $t0,$t0,1		# increment pointer
	j loop1			# reiterate loop1

print:	la $a0,str		# load new str
	li $v0,4		# 4 = print_string
	syscall
	
	li $v0,10		# 10 = end
	syscall
		
	.data
str:	.asciiz "Hello, world!\n"
