		.text
main:	la $a0,prompt		# print prompt
	li $v0,4		# 4 = print string (pstr label? Must use jal.)
	syscall
		
	li $v0,5		# 5 = read int
	syscall
		
	move $t1,$v0		# put input in t1
		
	la $a0, answer		# print answer header
	li $v0,4		# 4 = print string
	syscall
		
	move $t0,$0		# clear counter (necessary?)
		
	li $v0,11		# load 11 into v0
elim:	rol $t1,$t1,4		# left rotate msb into right-most bit for evaluation
	and $a0,$t1,0xf		# mask off left most digit
	bgtz $a0,num		# if not zero, go to char conversion
		
	# if all zero
	add $t0,$t0,1		# increment counter
	beq $t0,8,zero		# print
	j elim			# get next character

	# use jal?
loop:	rol $t1,$t1,4		# rotat MSB into right-most bit
	and $a0,$t1,0xf		# mask left most digits

num:	ble $a0,9,conv		# convert to char if hex # 0-9
	add $a0,$a0,7		# add 7 for hex numbers a-for
		
		
	# Number to ASCII Conversion Routine
conv:	add $a0,$a0,48		# Convert number to ascii
	syscall			# output ascii. Where is v0? Look at end of main.
	add $t0,$t0,1		# increment counter
	blt $t0,8,loop		# if word is not fully analyzed, loop again
	j next			# if complete, go to print
	
zero:	li $a0,0x30		# if number was zero, put ascii version of zero in buffer
	syscall

next:	li $a0,0x0a		# print carriage return
	syscall
		
	la $a0,comp		# Prompt for try again
	li $v0,4
	syscall
		
	li $v0,11		# 11 = carriage return
	li $a0,0x0a		# 0x0a = new line
	syscall
		
	li $v0,12		# 12 = read char (y or n)
	syscall
		
	beq $v0,0x79,main	# if yes, start over
		
	li $v0,10		# 10 = end
	syscall
		
	.data
prompt:	.asciiz "Enter decimal number *8 digits, maximum): "
answer:	.asciiz "Hexadecimal number is 0x:"
comp:	.asciiz "Input another number (y/n)? "
		
		
		
		
