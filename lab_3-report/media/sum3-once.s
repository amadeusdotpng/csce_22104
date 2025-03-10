.data
	input_prompt: .asciiz "Enter an Integer >> "
	sum_text: .asciiz "The sum is: "

.text
...
main:
	# print prompt
	li $v0, 4               # opcode to print string
	la $a0, input_prompt    # load address of string you want to print
	syscall

	# read first integer
	li $v0, 5       # opcode to read in an integer
	syscall
	move $s0, $v0   # syscall puts int to $v0, so move it to $s0 since you want to use $v0 again later
    ...
