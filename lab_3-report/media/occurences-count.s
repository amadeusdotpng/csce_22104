.data
    ...
	occur_number:  .asciiz "Number of occurences found:\n"

.text
main:
    ...
    li $a0, occur_number
	li $v0, 4
	syscall

	# print number of occurences found
	move $a0, $s4 
	li $v0, 1
	syscall
	
	jr $ra

