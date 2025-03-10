.data
	number_array: .space 40
	input_prompt:  .asciiz "Type in array numbers:\n"
    ...

.text
main:
	li $a0, input_prompt
	li $v0, 4
	syscall
	
	li $s0, number_array	# intialize array address
	li $s1, 40  			# array size
	li $s2, 0				# initialize i

input_loopstart:
	# check conditions
	bge $s2, $s1, input_loopexit
	
	li $v0, 5	
	syscall
				
	add $t0, $s0, $s2	
	sw $v0, 0($t0)		# store the int that's read to array
	
	addi $s2, $s2, 4	

	j input_loopstart
	
input_loopexit:
    ...

