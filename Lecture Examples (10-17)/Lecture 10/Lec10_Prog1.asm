	.text
main:	li $t0 47				#x
		li $t1 253				#y
		li $t2 23				#z
		 
		 #x^2 + 2y + 10z
		 mul $t4, $t0, $t0		#x^2
		 mul $t5, $t1, 3		#2y
		 mul $t6, $t2, 10		#10z
		 
		 add $t3, $t4, $t5		#x^2 + 2y
		 add $t3, $t3, $t6		#x^2 + 2y + 10z
		 
		 li $v0, 10
		 syscall				#End		