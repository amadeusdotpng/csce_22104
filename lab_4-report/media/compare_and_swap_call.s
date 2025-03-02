bubble_sort_array_accesses:
	sll $t0, $s3, 2
	add $a0, $s0, $t0
	move $a1, $a0
	addi $a1, $a1, 4
	jal compare_and_swap
