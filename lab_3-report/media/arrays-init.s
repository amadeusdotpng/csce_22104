.data
	numbers_string: .asciiz "Numbers: "
	x_array: .word 18, 12, 6, 500, 54, 3, 2, 122
	newline: .asciiz "\n"

.text
main:
	# print "Numbers: \n"
	la $a0, numbers_string
	li $v0, 4
	syscall
	
	# print newline
	la $a0, newline
	li $v0, 4
	syscall
    ...
