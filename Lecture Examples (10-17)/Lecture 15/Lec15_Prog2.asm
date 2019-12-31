	.text
main:	la $t0, str		# pointer
	li $v0, 11		# 11 = print char
		
loop:	lb $a0,0($t0)
	beqz $a0,exit
	blt $a0,0x61,incr	# if outside range, don't print
	bgt $a0,0x7a,incr
	syscall			# print char
	
incr:	add $t0,$t0,1		# increment pointer
	j loop

exit:	li $v0,10
	syscall
	
	# 11 lines
	
	.data
str:	.asciiz "ab12Cd"
