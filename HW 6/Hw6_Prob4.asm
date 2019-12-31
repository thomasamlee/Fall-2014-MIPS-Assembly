	.text
main:	la $t0,w		# address pointer in t0
	li $t1,0		# counter in t1
	
loop:	beq $t1,12,end		# if counter = 12, end	
	lb $a0,0($t0)		# byte in t2 (why did it load 85)
	beq $a0,0x20,print	# if byte = space, print
	beq $a0,0x21,print	# if byte = !, print
	beq $a0,0x0a,print	# if byte = new line, print
	bge $a0,0x41,upper	# if byte might be capitalized, go to upper
	j incr			# else, increment
	

upper:	ble $a0,0x5a,print	# if byte is capitalized, print
				# else, increment (fall through)
					
incr:	add $t0,$t0,1		# next address
	add $t1,$t1,1		# increment pointer (upto 12x)
	j loop
	
print:	li $v0,11		# 11 = print_char
	syscall
	j incr

end:	li $v0,10		# 10 = exit
	syscall

	.data
w:	.word 0x44305455
x:	.word 0x43314520
y:	.word 0x0a213753
