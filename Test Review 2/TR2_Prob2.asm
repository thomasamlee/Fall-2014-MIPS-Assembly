	.text
main:	lw $a0,data1		
	mul $a0,$a0,$a0		# square data1
	sw $a0,data2		# store in data2
		
	bgt $a0,0xff,less	# greater than 0xff 
	j end
		
less:	blt $a0,0xffff,print	# less than 0xff
	j end
		
print:	li $v0,1	
	syscall
	j end
		
end:	li $v0,10
	syscall

	.data
data1:	.word 0x3a
data2:	.word 0
