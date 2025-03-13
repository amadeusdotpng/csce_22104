.text
    ...
fib:
    ... # testing for base cases
    # create stack
	addi $sp, -8    
	sw $ra, 4($sp)
	sw $a0, 0($sp)  # we're going to store n and the result of fib(n-1) here
	
	# fib(n-1)
	addi $a0, $a0, -1
	jal fib
	
	lw $a0, 0($sp)  # we load the original n passed
	sw $v0, 0($sp)  # then store the result of fib(n-1)

	# fib(n-2)
	addi $a0, $a0, -2
	jal fib         # remember that fib(n-2) is at $v0 after this instructoin
	
	# restore stack
	lw $t0, 0($sp)  # load fib(n-1)
	lw $ra, 4($sp)
	addi $sp, 8
	
	# return fib(n-1) + fib(n-2)
	add $v0, $v0, $t0	
	jr $ra

	... # base cases
