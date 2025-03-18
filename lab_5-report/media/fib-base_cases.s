.text
    ...
fib:
	blt $a0, $zero, fib_ret_negative
	beq $a0, $zero, fib_ret_zero
	li $t0, 1
	beq $a0, $t0, fib_ret_one
	
    ... # handle recursive case

	fib_ret_negative:
	li $v0, -1
	jr $ra
	
	fib_ret_zero:
	li $v0, 0
	jr $ra
	
	fib_ret_one:
	li $v0, 1
	jr $ra
