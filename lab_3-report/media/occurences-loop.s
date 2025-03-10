.data
	number_array: .space 40
    ...

.text
main:
    li $s0, number_array    # initialize array address
    li $s1, 40              # initialize array size
    li $s2, 0	            # initialize i

occur_loopstart:
	bge $s2, $s1, occur_loopexit
	
	add $t0, $s0, $s2
	lw $t1, 0($t0)

    # if(x[i] = occur) ...

	addi $s2, $s2, 4
	j occur_loopstart

occur_loopexit:
    ...
