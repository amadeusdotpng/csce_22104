.data
	random_array: .word 65, 55, 33, 9, 76
	reverse_sorted_array: .word 32, 16, 8, 4, 2
	almost_sorted_array: .word 2, 4, 8, 32, 16
	sorted_array: .word, 2, 4, 8, 16, 32
	value_buffer_text_1: .asciiz "The data contained in the buffer at 0x"
	value_buffer_text_2: .asciiz " is: "
	value_buffer_text_separator: .asciiz "Ox"
	text_newline: .asciiz "\n"

.globl _start

.text
_start:
	jal main # Jump to main function, able to return afterwards for a clean exit.
	li $v0, 10 # Load
	syscall

# This subroutine prints a single new line character to the standard output, then returns.
print_newline:
	la $a0, text_newline # Load new_line address of string into syscall parameter register
	li $v0, 4	 		 # Load the print_string op code into syscall operation register
	syscall	   		 # Execute the opcode in $v0, printing the string pointed to by $a0
	jr $ra				 # Return to the instruction pointed to by the return address register

# This subroutine prints takes in two parameters, a memory address and a buffer size.
# It, word by word, prints a number of bytes equal to the buffer size, starting from the
# given buffer address, to the standard output, then returns.
print_buffer:
	# We have parameters this time!
	# $a0 - The address of the buffer to print
	# $a1 - The size of the buffer to print in bytes
	# We have to save those into other registers before doing anything else so they don't get clobbered!!
	# Normally, the convention says that temp ($tX) registers are NOT necessarily perserved after
	# a function call, but since we've written print_newline we know it doesn't mutate $t0 and $t1, so
	# they are safe to use!
	move $t0, $a0		 # Save buffer location into $t0
	move $t1, $a1		 # Save buffer size into $t1
	li $t2, 4
	mult $t1, $t2
	mflo $t1			# Multiply buffer size by 4 to get byte-addressed size
	# Now we can proceed as normal! Printing a new line here just so the output is easy to read!
	addiu $sp, $sp, -4
	sw $ra, 0($sp)		 # Save $ra to avoid it being overwritten when we call another function
	jal print_newline	 # Function call to print a new line
	# First, we print the starting text:
	la $a0, value_buffer_text_1		# Load the address of value_buffer_text_1 into the syscall parameter register
	li $v0, 4	 		 			# Load the print_string op code into syscall operation register
	syscall	   						# Execute the opcode in $v0, printing the string pointed to by $a0
	# Now to print the address of the buffer in hex:
	move $a0, $t0		 # Remember, we moved the buffer location into $t0! Moving it back to where syscall expects!
	li $v0, 34			 # 34 (in decimal) is the op code for printing an integer (or word in our case) in hex
	syscall
	# Next, there's a connecting string we want to print:
	la $a0, value_buffer_text_2		# Load the address of value_buffer_text_2 into the syscall parameter register
	li $v0, 4	 		 			# Load the print_string op code into syscall operation register
	syscall	   						# Execute the opcode in $v0, printing the string pointed to by $a0
	# Another new line, for clarity
	jal print_newline
	# Here's the fun part! Since we don't know how long the buffer is until the function is called,
	# we don't know how many things to print! So, we have to loop!
	# We don't have all the fancy bells and whistles of a higher level language like a for loop,
	# so we're going to have to make it ourselves. Here's how this is going to work:
	# We're going to use $t2 as our loop variable. We want it to start at 0 like normal,
	# then we're going to loop until it's equal to the size of the buffer, which means we've
	# iterated over all of the words in the buffer.
	# To keep track of registers:
	# $a0 - The place we put the things we want to print. (Function call 1st parameter register)
	# $v0 - The place we put the opcode of our syscall
	# $t0 - The address of the buffer being printed in memory
	# $t1 - The size of the buffer being printed
	# $t2 - The current offset. This is our loop variable!
	# $t3 - Holds the difference of the offset - the size. This is our loop comparison variable!
	# $t4 - The address we're actually looking at in memory (buffer + offset)
	li $t2, 0						# Loading 0 into $t2 just to be sure it's empty!
	print_buffer_loop_start:
		sub $t3, $t2, $t1 					  # Subtract the current offset from the size of the buffer
		bgez $t3, print_buffer_loop_end		  # If that difference is positive, the offset is bigger and we halt the loop.
		# Let's print an '0x' to remind ourselves that these values are in hexadecimal
		la $a0, value_buffer_text_separator # Load the string to print to $a0
		li $v0, 4							  # Load the print_string op code to $v0
		syscall
		# Else, we keep going and print the next thing!
		# Offsets for SW/LW have to be immediate values, not registers.
		# To get the same effect, we have to manually add the registers together.
		add $t4, $t0, $t2
		lw $a0, ($t4)						  # Load the word at the buffer's address plus the current offset into $a0
		li $v0, 34							  # Load print_int_as_hex as our syscall opcode
		syscall
		jal print_newline
		# Now we have to increment our loop variable! Remember that it's in bytes, so we have to add 4!
		addi $t2, 4
		j print_buffer_loop_start  			  # We have to manually jump back to the top!
	print_buffer_loop_end:
	# After looping over the entire buffer, let's print another new line.
	jal print_newline
	# Then, we return control flow to the main function.
	lw $ra, 0($sp) 		# Remember, we stored the return address onto the stack to prevent it from being clobbered.
	addiu $sp, $sp, 4
	jr $ra				# Return to the instruction pointed at by $ra

compare_and_swap:
	# Takes in two addresses, compares the words at each, and swaps them if necessary.
	# Parameters:
	# - $a0: Memory address number 1
	# - $a1: Memory address number 2
	# Returns:
	# - Nothing directly. Return with the lower value in the address given at $a0,
	#   and the higher value at $a1.
	# YOUR CODE HERE
	lw $t0, 0($a0)
	lw $t1, 0($a1)
	ble $t0, $t1, compare_and_swap_exit
	sw $t1, 0($a0)
	sw $t0, 0($a1)

compare_and_swap_exit:
	jr $ra

bubble_sort:
	# Store previous return address onto the stack
	addiu $sp, $sp, -4 # Expand stack
	sw $ra, 0($sp) # Place return address into newly added stack slot
	move $s0, $a0 # Move address of array to be sorted from argument register into saved register.
	move $s1, $a1 # Move length of array to be sorted from argument register into saved register.
	# int i = 0;
	li $s2, 0   # Load 0 into $s2, which will be our outer loop counter
	# int j = 0;
	li $s3, 0   # Load 0 into $s3, which will be our inner loop counter

bubble_sort_outer_loop_check:
	# if i >= array_size - 1, break
	addi $t0, $s1, -1 # store array_size - 1 in $t0
	slt $t0, $s2, $t0 # compare against i
	beq $t0, $zero, bubble_sort_done

bubble_sort_inner_loop_check:
	# if j >= array_size - i - 1, break
	sub $t0, $s1, $s2 # store array_size - i in $t4
	addi $t0, $t0, -1 # store array_size - i - 1 in $t4
	slt $t0, $s3, $t0 # compare against j
	beq $t0, $zero, bubble_sort_outer_loop_increment

bubble_sort_array_accesses:
	# YOUR CODE HERE
	sll $t0, $s3, 2
	add $a0, $s0, $t0
	move $a1, $a0
	addi $a1, $a1, 4
	jal compare_and_swap

bubble_sort_inner_loop_increment:
	addi $s3, $s3, 1	# Increment j (stored in $t3)
	j bubble_sort_inner_loop_check

bubble_sort_outer_loop_increment:
	addi $s2, $s2, 1	# Increment i (stored in $t2)
	li $s3, 0 # Reset j
	j bubble_sort_outer_loop_check

bubble_sort_done:
	# Pop previous return address off of the stack.
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	# Lines to sort all four arrays are here, comment or uncomment as needed.
	la $a0, random_array # Load address of array to be sorted into $s0
	# la $a0, reverse_sorted_array # Load address of array to be sorted into $s0
	# la $a0, almost_sorted_array # Load address of array to be sorted into $s0
	# la $a0, sorted_array # Load address of array to be sorted into $s0
	li $a1, 5
	jal bubble_sort
	la $a0, random_array
	li $a1, 5
	jal print_buffer
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
