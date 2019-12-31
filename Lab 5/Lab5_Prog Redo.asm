# Alphabetize a string of 12-15 random small letters.
# Using syscall 8, input string into buffer (string1, 20-30 bytes)
# Remove any characters that are not small letters (x < 0x61 || x > 0x7a) 
# Output the ordered letters, preceded by “The alphabetized string is: " 

# Used Registers:
# $t0 = letters of alphabet
# $t1 = current pointer
# $t2 = current byte
# $t8 = stack pointer

	.text
main:	la $a0,str1			# a0 = buffer	(string's storage address)
	li $a1,15			# a1 = string length (12-15 random small letters)
	li $v0,8			# 8 = read string
	syscall
	
	la $a0,ans			# load output prompt
	li $v0,4			# 4 = print string
	syscall

	li $t0,0x7a			# t0 = alphabet (initialized as 'a')	
	la $t1,str1			# t1 = string pointer
	move $t8,$sp			# t8 = stack pointer
	j comp
	
next:	sub $t0,$t0,1			# next letter
	blt $t0,0x61,print		# if not a small letter, print
	la $t1,str1			# reset current byte pointer	
	
comp:	lb $t2,($t1)			# load current byte
	bne $t2,$t0,new			# if equal to current letter, store and decrement stack pointer
	sub $t8,$t8,1			# decrement stack pointer (pointing to occupied space after storing)
	sb $t2,($t8)			# push byte into stack
	
new:	add $t1,$t1,1			# if not same letter, new current byte
	beqz $t2,next			# if new current byte = null, next letter in alphabet
	j comp	
	
print:	move $a0,$t8			# should be pointing to address bottom of stack
	syscall
	
	li $v0,10			# 10 = exit
	syscall
	
	# 25 lines
	
	.data	
ans:	.asciiz "The alphabetized string is: "
str1:	.space 20
