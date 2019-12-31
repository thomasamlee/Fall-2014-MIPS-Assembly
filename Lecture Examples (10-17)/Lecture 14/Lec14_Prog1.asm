	.text
main:	lw $a0,chars

	li $v0,11	# 11 = print bottom byte
	syscall
			
	ror $a0,$a0,8	# Move to next byte (8 bits = 1 byte)
	syscall
		
	ror $a0,$a0,8
	syscall
		
	ror $a0,$a0,8
	syscall
		
	li $v0,10	# 10 = exit
	syscall

	.data
chars:	.word  0x21445455
