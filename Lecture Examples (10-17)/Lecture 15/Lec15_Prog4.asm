	.text
main:	la $t0,number
	li $v0,4

loop:	lw $a0,0($t0)
	beqz $a0,done		# if null, done
	bge $a0,0x61,upper		
	syscall

upper:	ble $a0,0x7a,incr
			

incr:	add $t0,1
	j loop

done:	li $v0,10
	syscall
		
	.data
number:	asciiz "1234abcdEF56GHi89"
