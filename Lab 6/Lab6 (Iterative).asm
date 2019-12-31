# $t0 = byte pointer
# $t1 = placement byte
# $t2 = comparison byte (storage byte)

	.text
	# character input routine
main:	la $a0,input		# print input prompt
	li $v0,4		# 4 = print string
	syscall
	li $v0,12		# 12 = read char
	syscall			# char stored in $v0
	move $t1,$v0		# move new byte to t2
	beq $t1,0x50,print	# if input = 'P', print
	blt $t1,0x61,error	# if not lowercase, try again
	bgt $t1,0x7a,error	
	la $t0,str		# t0 = string pointer
	
	# comparison routine
loop:	lb $t2,($t0)		# t1 = comparison byte
	bne $t1,$t2,next	# if new byte is equal to comp byte, insert letter after comp byte (recursive loop)
	j insert
	
next:	add $t0,$t0,1		# else, move to next byte in alphabet
	j loop
	
	# placement routine
insert:	lb $t2,($t0)		# load byte into buffer register
	sb $t1,($t0)		# store placement byte in its new place
	move $t1,$t2		# move byte from buffer to placement register
	add $t0,$t0,1		# move downstream
	beqz $t1,main
	j insert

error:	la $a0,errmsg
	syscall
	j main
	
	# print and exit routine
print:	li $v0,4		# 4 = print string
	la $a0,str
	syscall
	
	li $v0,10		# 10 = end
	syscall

	.data
input:	.asciiz "Please enter a lowercase letter to add to the string.\n Enter uppercase 'P' to print the string.\n"
errmsg:	.asciiz "Not a lowercase letter. Try again.\n"
str:	.asciiz "abcdefghijklmnopqrstuvwxyz"
	.space 30
