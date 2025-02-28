.data
	number_array: .space 40
	input_prompt:  .asciiz "Type in array numbers:\n"
	occur_prompt:  .asciiz "Type in occurence value:\n"
	occur_indices: .asciiz "Occurence indices are:\n"
	occur_number:  .asciiz "Number of occurences found:\n"
	newline: .asciiz "\n"
	# i don't think we need these two really.
	# there's no point since they can just live in
	# the registers till the function ends.
	# occur: .word 0
	# count: .word 0
.text
.global _start
_start:
	jal main
	li $v0, 10
	syscall		# Use syscall 10 to stop simulation

main:
	# get array numbers
	
	# print number input prompt
	li $a0, input_prompt
	li $v0, 4
	syscall
	
	
	# loop preparations
	li $s0, number_array	# intialize array address
	li $s1, 40  			# array size
	li $s2, 0				# initialize i

input_loopstart:
	# check conditions
	bge $s2, $s1, input_loopexit
	
	# main body
	li $v0, 5	# read int
	syscall
	move $t1, $v0 # honestly idk if we need to do this
				  # we can just read it straight from $v0 i think
				
	add $t0, $s0, $s2	# add offset to array address
	sw $t1, 0($t0)		# store the int that's read to array
	
	# increment index + loop back
	addi $s2, $s2, 4	# 4 since integers are 4 bytes
	j input_loopstart
	
input_loopexit:
	# Zhu Li do the thing!!!
	
	# print occurence prompt
	li $a0, occur_prompt
	li $v0, 4
	syscall
	
	# get occurence value + count
	li $v0, 5	# read int
	syscall
	move $s3, $v0	# occurence value
	li $s4, 0	# count
	
	# print occurence indices thing
	li $a0, occur_indices
	li $v0, 4
	syscall
	
	
	# loop preparations
    # we don't need to re-initialize the array address + array size since
    # those registers haven't been touched since
	li $s2, 0	 # initialize i (this has been changed)

occur_loopstart:
	# check conditions
	bge $s2, $s1, occur_loopexit
	
	# main body
	add $t0, $s0, $s2
	lw $t1, 0($t0)
	bne $s3, $t1, occur_ifexit
	
occur_ifstart:
	# print index
	srl $a0, $s2, 2	# need to divide offset by 4
	li $v0, 1
	syscall
	
	li $a0, newline
	li $v0, 4
	syscall
	
	# increment count
	addi $s4, $s4, 1
	
occur_ifexit:
	# increment offset + loop back
	addi $s2, $s2, 4	# 4 since integers are 4 bytes
	j occur_loopstart
	
occur_loopexit:
	# print number of occurences found
	li $a0, occur_number
	li $v0, 4
	syscall
	
	move $a0, $s4
	li $v0, 1
	syscall
	
	jr $ra
