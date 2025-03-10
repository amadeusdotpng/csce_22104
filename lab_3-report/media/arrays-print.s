...
.text
main:
    ...
loop_start:
    ...
    # print integer in $t1
	move $a0, $t1
	li $v0, 1
	syscall
	
	# print newline
	la $a0, newline
	li $v0, 4
	syscall
    ...

loop_exit:
    ...
