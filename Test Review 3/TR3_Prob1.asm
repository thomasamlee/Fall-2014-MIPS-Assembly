# $t0 = pointer
# $t1 = byte
# $t2 = letter count
	
	.text
main:	la $t0,str
count:	lb $t1,($t0)
	beqz $t1,end
	blt $t1,0x61,next
	bgt $t1,0x7a,next
	add $t2,$t2,1
next:	add $t0,$t0,1
	j count
	
end:	move $a0,$t2
	li $v0,1
	syscall
	li $v0,10
	syscall
	
	.data
str: .asciiz "hello, world!"