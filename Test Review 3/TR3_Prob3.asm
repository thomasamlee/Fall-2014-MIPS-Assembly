# $t0 = hex number
# $t1 = mask (0xf)
# $t2 = masked byte
# $t3 = zero counter
# $t8 = iteration counter
	
	.text
main:	lw $t0,data1
	li $t1,0xf
	
loop:	and $t2,$t0,$t1		# and mask with hex number to isolate first byte
	bnez $t2,next		# if byte is not zero, move to next byte	
	add $t3,$t3,1		# if byte = 0, increment zero counte
next:	rol $t0,$t0,4		# rotate right 1 byte (4 bits)
	add $t8,$t8,1		# increment iteration counter
	bne $t8,8,loop		# if 8 iterations, done
	
done:	move $a0,$t3		# print the amount of zeros
	li $v0,1
	syscall
	li $v0,10
	syscall

	.data
data1:	.word 0x9f07ec03
