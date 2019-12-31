		.text
main: 	lw $a0,data1		# check data1
		bltz $a0,print		# print if negative
		j next
		
next:	lw $a0,data2		# check data2
		bltz $a0,print		# print if negative
		j exit
		
print: li $v0,1				# 1 = print_int
		syscall

exit:  li $v0,10			# 10 = exit
		syscall
		
		.data
data1:	.word 0x6372eef5
data2:	.word 0x91abccd2

