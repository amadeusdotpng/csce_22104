.data
    ...
	occur_prompt:  .asciiz "Type in occurence value:\n"
    ...

.text
main:
    ...
	li $a0, occur_prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0   # occurence value
	li $s4, 0       # count
    ...
