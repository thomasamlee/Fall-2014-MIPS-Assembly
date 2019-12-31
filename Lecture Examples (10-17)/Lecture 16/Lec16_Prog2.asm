# $t0 = hex number
# $t1 = counter
# $t2 = masked hex
	
	.text
main:	li $t0,0x84c732d6	# hex num in t0
loop:	rol $t0,$t0,8		# rotate left by 1 byte
	
	andi $t2,$t0,0xff	# mask first byte
	sb $t2,data1		# store masked byte
	
	lb $a0,data1		# load single byte
	li $v0,1		# 1 = print int
	syscall
		
	li $a0,0x0a		# new line
	li $v0,11
	syscall
		
	add $t1,$t1,1		# counter up to 4
	blt $t1,4,loop		# if counter = 4, exit
	
	li $v0,10		# 10 = exit
	syscall
	
	# 14 lines
	
	.data
data1:	.space 1
