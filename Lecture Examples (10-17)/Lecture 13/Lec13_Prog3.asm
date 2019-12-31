	.text
main:	la $t0,str		# pointer in t0
	move $a0,$0		# intialize a0 = 0 (Must for QtSpim)

loop:	lb $t1,0($t0)		# load byte in t1
	beqz $t1,print		# if null, print counter
	blt $t1,0x61,next	# if outside lowercase range, next address
	bgt $t1,0x7a,next
	add $a0,$a0,1		#increment lowercase counter in a0
	
next:	add $t0,$t0,1		# increment pointer	
	j loop
	
print:	li $v0,1		# 1 = print int
	syscall
	
	li $v0,10		# 10 = exit
	syscall
	
	# 13 lines total
	
	.data
str:	.asciiz "Hello, world!\n"
