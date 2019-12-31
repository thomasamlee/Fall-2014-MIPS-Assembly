# n! = n(n-1)!
# $t0 = n! 	Cumulative result
# $t1 = (n-1)! 	also used as counter

	.text
main: 	la $a0,input		# load input prompt
	li $v0,4		# 4 = print string
 	syscall
 	li $v0,5		# 5 = input int
 	syscall
 	move $a0,$v0		# Store original input for correct prompt
 	beqz $v0,prnt0		# if input is zero, jump to prnt0
	move $t1,$v0		# Store input in t1 (decremented & multiplied with t0 until 0)
 	li $t0,1		# Result (initialized as 1!=1)
 	jal decr
 	
 	# Print routine
 	# last $ra here
 print:	li $v0,1		# 1 = print int
 	syscall			# print original n for prompt
 	la $a0,ans		# load ans prompt
	li $v0,4		# 4 = print string
	syscall
 	move $a0,$t0		# load result of n!
	li $v0,1		# 1 = print int
	syscall
	li $v0,10		# 10 = exit
 	syscall
 	
prnt0:	li $t0,1		# set 0!=1
	j print
#-----------------------------------------------------No Man's Land------------------------------------------------------------ 

decr: 	sw $ra,($sp)		# store return address for backstepping
 	sub $sp,$sp,4		# move down stack
	sub $t1,$t1,1		# for every address stored, (n-1) is decremented
	bgtz $t1,back		# when (n=1) = 0, start factorial
	j fact
	
back: 	jal decr		# decrement loop, and save address for number of factorial loops

fact: 	add $t1,$t1,1		# first increment to make (n-1)=1
	mul $t0,$t0,$t1		# n(n-1)!
	add $sp,$sp,4		# move up stack
	lw $ra,0($sp)		# load next iteration of fact, last $ra = print routine
	jr $ra			# fact,fact,fact.....print

	.data
input:	.asciiz "Input integer (0-12)\n"
ans:	.asciiz " factorial is "