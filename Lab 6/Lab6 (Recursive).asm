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
	li $v0,4
	beq $t1,0x50,print	# if input = 'P', print
	blt $t1,0x61,error	# if not lowercase, try again
	bgt $t1,0x7a,error	
	la $t0,str		# t0 = string pointer
	
loop:	lb $t2,($t0)		# t1 = comparison byte
	beq $t1,$t2,match	# if new byte is equal to comp byte, start recursion
	add $t0,$t0,1		# else, move to next byte in alphabet
	j loop
	
match:	jal fwd			# last return address
	sb $t1,($t0)		# store new byte in newly created space
	j main
	
fwd:	sw $ra,($sp)		# push return address onto stack
	sub $sp,$sp,4		# decrement stack pointer, convention: point to next empty space
	add $t0,$t0,1		# move downstream
	lb $t2,($t0)		# load next byte into storage register
	beqz $t2,insert		# when current byte is null, start shifting
	jal fwd
	sub $t0,$t0,1		# move upstream
	lb $t2,($t0)		# load new byte
	add $t0,$t0,1		# move back downstream
	sb $t2,($t0)		# store byte in new place
	sub $t0,$t0,1		# move to next place (upstream) (xyzz - pointing at first z)
insert:	add $sp,$sp,4		# move up stack
	lw $ra,($sp)		# load next return address
	jr $ra			
	
error:	la $a0,errmsg		# print error message
	syscall
	j main
	
print:	la $a0,str		# print alphabet with inserted letters
	syscall
	
	li $v0,10		# 10 = end
	syscall

	.data
input:	.asciiz "Please enter a lowercase letter to add to the string.\n Enter uppercase 'P' to print the string.\n"
errmsg:	.asciiz "Not a lowercase letter. Try again.\n"
str:	.asciiz "abcdefghijklmnopqrstuvwxyz"
	.space 30
