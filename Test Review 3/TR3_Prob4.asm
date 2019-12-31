# $t0 = countdown register
# $t1 = seconds counter
	
	.text
main:	li $t0,5		# reset to count another second
cntdwn:	sub $t0,$t0,1		# count down to zero
	bnez $t0,cntdwn		# if zero is reached, display time

time:	add $t1,$t1,1		# increment seconds
	li $v0,1		# 1 = print int
	move $a0,$t1		# print time
	syscall
	li $v0,11		# 11 = print char
	li $a0,0x0a		# load carriage return
	syscall
	bne $t1,30,main		# if 30 seconds have elapsed, finish

	li $v0,10
	syscall
