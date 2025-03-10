...
.text
main:
    ...
	li $s1, 0               # initialize i
	li $s2, 32              # array size
	la $s0, x_array         # address of number array
	
loop_start:
	bge $s1, $s2, loop_exit    # check if i is equal to array size; goto after_loop if equal
	
	add $t0, $s0, $s1   # get address of array[index]
	lw $t1, 0($t0)      # load the actual content in the address
	
    # print integer in $t1
    # print newline

	addi $s1, 4 # increment offset

	j loop_start      # loop back
	
loop_exit:
	jr $ra
