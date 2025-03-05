.data
	number_prompt: .asciiz "Enter an Integer >> "
	result_text_0: .asciiz "Fib("
	result_text_1: .asciiz ") = "
	newline: .asciiz "\n"

.text
.global _start
_start:
	jal main
	li $v0, 10
	syscall		# Use syscall 10 to stop simulation

fib:
	# test base cases
	blt $a0, $zero, fib_ret_negative
	beq $a0, $zero, fib_ret_zero
	li $t0, 1
	beq $a0, $t0, fib_ret_one
	
	# start of recursive case, n > 1
	# create stack
	addi $sp, -8	# sorry luka... i like it this way better...
					# it's how i was taught
	sw $ra, 4($sp)
	sw $a0, 0($sp)	# we're going to store n and  
					# the result of fib(n-1) here
	
	# fib(n-1)
	addi $a0, $a0, -1
	jal fib
	
	lw $a0, 0($sp)	# we load the original n passed
	sw $v0, 0($sp)	# then store the result of fib(n-1)

	# fib(n-2)
	addi $a0, $a0, -2
	jal fib			# remember that fib(n-2) is at $v0
					# after this instructoin
	
	# restore stack
	lw $t0, 0($sp)	# load fib(n-1)
	lw $ra, 4($sp)
	addi $sp, 8
	
	# return fib(n-1) + fib(n-2)
	add $v0, $v0, $t0	
	jr $ra
	
	# base cases
	fib_ret_negative:
	li $v0, -1
	jr $ra
	
	fib_ret_zero:
	li $v0, 0
	jr $ra
	
	fib_ret_one:
	li $v0, 1
	jr $ra
	
main:
	# create stack
	addiu $sp, $sp, -12
	sw $ra, 8($sp)
	sw $s0, 4($sp)	# i want to store n and fib(n)
	sw $s1, 0($sp)	# at $s0 and $s1
	
	li $v0, 4
	la $a0, number_prompt
	syscall
	
	# get n
	li $v0, 5
	syscall
	move $s0, $v0
	
	# calculate fib(n)
	move $a0, $v0
	jal fib
	move $s1, $v0
	
	li $v0, 4
	la $a0, result_text_0
	syscall
	
	li $v0, 1
	move $a0, $s0	# n
	syscall

	li $v0, 4
	la $a0, result_text_1
	syscall
	
	li $v0, 1
	move $a0, $s1	# fib(n)
	syscall
	
	# newline
	li $v0, 4
	la $a0, newline
	syscall

	# restore stack
	lw $s1, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	
	jr $ra
