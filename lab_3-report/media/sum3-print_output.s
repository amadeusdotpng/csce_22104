.data
	input_prompt: .asciiz "Enter an Integer >> "
	sum_text: .asciiz "The sum is: "

.text
...
main:
    ...
	# print sum text
	la $a0, sum_text
	li $v0, 4
	syscall
	
	# print sum
	li $v0, 1       # opcode to print an integer
	move $a0, $s3   # move the integer you want to print to the argument register
	syscall
    ...
