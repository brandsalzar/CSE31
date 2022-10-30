        .data
# TPS 2 #3 (statement to be displayed)
strInt: .asciiz "\n Please enter an integer: \n"

        .text
main: 		addi $sp, $sp, -4	# Moving stack pointer to make room for storing local variables (push the stack frame)
		# TPS 2 #3 (display statement)
		li $v0, 4	#print out the string
		la $a0, strInt	#load the address of our string into argument regsiter($a0)
		syscall		#print

		# TPS 2 #4 (read user input)
		li $v0, 5	#instruction to read the input of the user. Store into return registter $v0.
		syscall		#user input.
		move $a0, $v0	#we store into our argument register, $a0, because that will be our argument for our recursion function. add $a0, $v0, $zero

		jal recursion	# Call recursion(x)

		# TPS 2 #6 (read user input)
		addi $sp, $sp, -4	#create space in the stack

		sw $v0, 4($sp)		#push The value of $v0 into the stack
		lw $t0, 4($sp)		#pop the top of the stack into $t0

		li $v0, 1		#instruction for integer print  function
		add $a0, $t0,$zero	#use our $t0 for the printable
		syscall			#print

		addi $sp, $sp, 4	# pop the stack

		j end		# Jump to end of program


# Implementing recursion
recursion:	addi $sp, $sp, -12	# Push stack frame for local storage

		# TPS 2 #7
		sw $ra, 0($sp)

		addi $t0, $a0, 1
		bne $t0, $zero, not_minus_one	#if (m == -1){..} jump to

		# TPS 2 #8 (update returned value)
		li $v0, 1	#instance where the value is -1 so we return 1

		j end_recur

not_minus_one:	bne $a0, $zero, not_zero

		# TPS 2 #9 (update returned value)
		li $v0, 3	#instance where we have a zero and we return 3

		j end_recur

not_zero:	sw $a0, 4($sp)
		# TPS 2 #11 (Prepare new input argument, i.e. m - 2)
		addi $a0, $a0, -2


		jal recursion	# Call recursion(m - 2)

		# TPS 2 #12
		sw $v0, 8($sp)	#Top of stack


		# TPS 2 #13 (Prepare new input argument, i.e. m - 1)
		lw   $a0, 4($sp) 	#restore the value so you wont have (m-2)-1
		addi $a0, $a0, -1	#now you have m-1

		jal recursion	# Call recursion(m - 1)

		# TPS 2 #14 (update returned value)
		lw $a0, 4($sp)	#Reset as part of the convention
		lw $t0, 8($sp)	#load to

		add $v0, $t0, $v0 #add everything to our

		j end_recur


# End of recursion function
end_recur:	# TPS 2 #15
		lw   $ra, 0($sp) 	# return the original ra to main
		addi $sp, $sp, 12	# Pop stack frame
		jr $ra

# Terminating the program
end:	addi $sp, $sp 4	# Moving stack pointer back (pop the stack frame)
		li $v0, 10
		syscall
