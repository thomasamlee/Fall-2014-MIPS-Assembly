	.text
main:	li $a0,0		# counter in a0. QtSpim sets a0 = 5, must reinitialize as 0.
	la $t0,str		# pointer in t0
	li $t2,0x64		# comparison byte in t2
	
loop:	lb $t1,($t0)		# load byte from new address
	beq $t1,$t2,print	# if d, then go to print
	add $a0,$a0,1		# else, increment counter
	add $t0,$t0,1		# move pointer by 1 byte
	j loop
	
print:	li $v0,1		# 1 = print_int
	syscall			# counter already in a0
	li $v0,10		# 10 = exit
	syscall

	.data
str: 	.asciiz "Hello, World!\n"
