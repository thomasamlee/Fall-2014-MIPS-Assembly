# F(n) = F(n-1) + F(n-2)
# n>0, F(0) = 0, F(1) = 1
# $t0 = result & n countdown register
# $t1 = F(n-1)
# $t2 = F(n-2)
	
	.text
main:	la $a0,inpt		# print input prompt
	li $v0,4	
	syscall
	li $v0,5		# read n
	syscall
	move $t0,$v0		# move n into t0
	li $v0,4		# preload 4 into v0
	blt $t0,0,error		# Condition: 0 <= n <= 40
	bgt $t0,40,error
	
	sw $t0,n		# store n in memory
	blt $t0,2,print		# if n < 2, print
	li $t1,1		# initialize F(n-1) & F(n-2) as 1
	li $t2,0
	jal cntdwn
	
print:	la $a0,ans1		# print ans1, 4 already in v0
	syscall
	lw $a0,n		# print n
	li $v0,1
	syscall
	la $a0,ans2		# print ans2
	li $v0,4
	syscall
not2:	move $a0,$t0		# print result
	li $v0,1
	syscall
	la $a0,endl		# print endl
	li $v0,4
	syscall
	li $v0,10
	syscall			
	# END OF PROGRAM
	
cntdwn:	sw $ra,($sp)		# push return address onto stack
	sub $sp,$sp,4		# decrement stack
	beq $t0,2,fibo		# if n == 2, start 2nd loop
	sub $t0,$t0,1		# decrement n counter
	jal cntdwn
	
fibo:	add $sp,$sp,4		# increment stack
	lw $ra,($sp)		# pop return address off stack
	add $t0,$t1,$t2		# F(n-1) + F(n-2)
	# Preparation for next iteration
	move $t2,$t1		# move F(n-1) to F(n-2)
	move $t1,$t0		# move F(n) to F(n-1)
	jr $ra
	
error:	la $a0,errmsg
	syscall
	j main
	
	.data
inpt:	.asciiz "Input 2-digit number, 40 or less, for fibonacci calculation: "
errmsg:	.asciiz "Try again.\n"
ans1:	.asciiz "F("
ans2:	.asciiz ") is "
endl:	.asciiz ".\n"
n:	.word 0
