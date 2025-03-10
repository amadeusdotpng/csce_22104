# Use .set noreorder to prevent the assembler from filling branch
# delay slots, if you want to fill delay slots manually.
# .set noreorder
.data
	# basic types in ???
	# .space - raw empty memory
	# .word  - single whatever defined on your hardware
	# .ascii - variable is ASCII encoded.
	# .ascii - variable is ASCII encoded + nul terminator
	input_prompt: .asciiz "Enter an Integer >> "
	sum_text: .asciiz "The sum is: "

.text
.global _start
_start:
	jal main
	li $v0, 10
	syscall		# Use syscall 10 to stop simulation

main:
	# print prompt
	la $a0, input_prompt # load address of input_prompt
	li $v0, 4 # print_string
	syscall
	# read first integer
	li $v0, 5
	syscall
	move $s0, $v0 # syscall puts int to $v0, so move it to $t0
	# move is a pseudoinstruction that gets
	# translated to `addu $s0, $v0, $0`
	
	# ok copy that stuff three more times
	la $a0, input_prompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	la $a0, input_prompt # load address of input_prompt
	li $v0, 4 # print_string
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	
	# add the three numbers
	add $t0, $s0, $s1 # temporary for $s0 + $s1
	add $s3, $t0, $s2 # temp + $s2
	
	# print sum text
	la $a0, sum_text
	li $v0, 4
	syscall
	
	# print sum
	move $a0, $s3
	li $v0, 1
	syscall
	
	# exit
	jr $ra
	