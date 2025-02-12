.data
	# define x and any strings here
	numbers: .asciiz "Numbers: "
	number_array: .word 18, 12, 6, 500, 54, 3, 2, 122
	newline: .asciiz "\n"

.text
.global _start
_start:
	jal main
	li $v0, 10
	syscall		# Use syscall 10 to stop simulation
	
main:
	# print "Numbers: "
	la $a0, numbers
	li $v0, 4
	syscall
	
	# print newline
	la $a0, newline
	li $v0, 4
	syscall
	
	li $s1, 0            # initialize i
	li $s2, 32           # array size
	la $s0, number_array # address of number array
	
loop:
	# check if i is equal to array size; goto after_loop if equal
	bge $s1, $s2, after_loop
	
	add $t0, $s0, $s1 # get address of array[index]
	lw $t1, 0($t0)    # load the actual content in the address
	
	# print number
	move $a0, $t1
	li $v0, 1
	syscall
	
	# print newline
	la $a0, newline
	li $v0, 4
	syscall
	
	# increment offset
	addi $s1, 4
	
	# loop back!!
	j loop
	
after_loop:
	jr $ra