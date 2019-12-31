	.text
main:	li $t8,8 # set up counter
	la $t0,nums # load starting address
	move $t7,$t0 # keep add. for later compare
next:	beqz $t8,end # have we done ten compare sequences?
	lw $t1,0($t0) # \
	lw $t2,4($t0) # / get words
	ble $t1,$t2,cnt # are current numbers in correct order?
comp: 	jal rev
	j on
rev:	sub $sp,$sp,4	# \
	sw $ra,0($sp)	# / store $ra on stack
	lw $t1,0($t0)	# \
	lw $t2,4($t0)		# / get words
	ble $t1,$t2,back	# no’s now in order, move back down list
	sw $t1,4($t0)	# \
	sw $t2,0($t0)	# no’s are in wrong order; reverse them
go:	beq $t0,$t7,back# are we at the top of the list?
	sub $t0,$t0,4 	# no, therefore get next two words to
			# compare on "backwards move"
	jal rev 	# going back
back:	lw $ra,0($sp) 	# compare is at position 0, so we
 			# are done with one pass; go back to last
			# position and start new compare seq.
	addi $sp,$sp,4 	# getting next $ra
	addi $t0,$t0,4 	# moving back for next compare sequence
	jr $ra 		# are we back to pos. for next compare?
cnt:	addi $t0,$t0,4 	# go to start of next compare sequence
on:	sub $t8,$t8,1 	# finished one compare sequence, so we
	j next 		# start next one
end:	la $t0,nums 	# Print out results and end program
	li $t8,9
	li $v0,1
nxwd:	lw $a0,0($t0)
	syscall
	sub $t8,$t8,1
	beqz $t8,stop
	addi $t0,$t0,4
	j nxwd
stop:	li $v0,10
	syscall		# we are done; QUIT!
 	.data
nums:	.word 5,3,8,9,2,4,1,7,6