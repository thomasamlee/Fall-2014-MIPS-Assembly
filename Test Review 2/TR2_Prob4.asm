	.text
main:	la $t0,n		# pointer in t0
	lw $a0,0($t0)		# word in a0
	j loop

loop:	beqz $a0,finish		# if zero, end
	blt $a0,0,print		# if less than zero, print
	j incr			# else, increment

incr:	add $t0,$t0,4		# move pointer to next word (4 bytes)
	lw $a0,0($t0)		# load next word, no offset needed
	j loop
	
print:	li $v0,1		# 1 = print_int
	syscall
	
	li $a0,0x0a		# 0x0a = new line
	li $v0,11		# 11 = carriage return
	syscall
	j incr
	
finish:	li $v0,10		# 10 = end
	syscall
	
	.data
n:	.word 0x9750494d	# negative
p:	.word 0x20697320
q:	.word 0x61207573
r:	.word 0x6566756c
s:	.word 0x9073696d	# negative
t:	.word 0x756c6174
u:	.word 0x6f722066
v:	.word 0x6f72206c
w:	.word 0xff61726e	# negative
x:	.word 0x696e6720
y:	.word 0x8d495053	# negative
z:	.word 0x20617373
end:	.space 4