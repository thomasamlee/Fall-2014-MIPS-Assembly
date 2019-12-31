	.data
str:	.asciiz "hello, world\n"
ans:	.asciiz "The number of consonants is "

# $t0 = pointer
# $t1 = current byte
# $a0 = consonant count
	
	.text
main:	la $a0,ans		# print answer prompt
	li $v0,4		# 4 = print string
	syscall
	
	la $t0,str		# pointer
	move $a0,$0		# reintialize for consonant count		
	
loop:	lb $t1,($t0)		# load byte
	beqz $t1,print		# if null, print
	bgt $t1,0x7A,next	# if not a letter, next byte
	ble $t1,0x61,next	# if a or not a letter
	beq $t1,0x65,next	# if e
	beq $t1,0x69,next	# if i
	beq $t1,0x6f,next	# if o
	beq $t1,0x75,next	# if u
	add $a0,$a0,1		# else, increment consnant count

next:	add $t0,$t0,1		# move to next byte
	j loop
	
print:	li $v0,1		# 1 = print int
	syscall
	
	li $v0,10		# 10 = exit
	syscall
	
	# count = 7
	# 22 lines (Dodge = 24)
