.data
	number_array: .space 40
    ...

.text
main:
    li $s0, number_array    # initialize array address
    li $s1, 40              # initialize array size
    li $s2, 0	            # initialize i

occur_loopstart:
    ...
	bne $s3, $t1, occur_ifexit

occur_ifstart:
	li $v0, 1       # print index
	srl $a0, $s2, 2 # need to divide index by 4
	syscall
	
	li $a0, newline
	li $v0, 4
	syscall
	
	# increment count
	addi $s4, $s4, 1
	
occur_ifexit:
    ...
occur_loopexit:
    ...
