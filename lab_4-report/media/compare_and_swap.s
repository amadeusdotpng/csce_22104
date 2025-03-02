compare_and_swap:
	lw $t0, 0($a0)
	lw $t1, 0($a1)
	ble $t0, $t1, compare_and_swap_exit
	sw $t1, 0($a0)
	sw $t0, 0($a1)
compare_and_swap_exit:
	jr $ra
