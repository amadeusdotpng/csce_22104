...
.text
.global _start
_start:
	jal main
	li $v0, 10
	syscall # Use syscall 10 to stop simulation

main:
    ...
    jr $ra
	
