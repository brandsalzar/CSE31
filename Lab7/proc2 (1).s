		.data
x:		.word 5
y:		.word 10
m:		.word 15
b:		.word 2

		.text
MAIN:	la $t0, x	#store address of x into $t0
	lw $s0, 0($t0)	# s0 = x
	la $t0, y	#load adress of y into $t0
	lw $s1, 0($t0) 	# s1 = y
	# Prepare to call sum(x)
	add $a0, $zero, $s0	# Set a0 as input argument for SUM. $a0 = x
	jal SUM			#jump to sum and store address of next lin in $ra
	add $t0, $s1, $s0	#$ra will return here. $t0 = y + x
	add $s1, $t0, $v0	# y = (y + x) + (x + ((m + x) - b))
	addi $a0, $s1, 0 	# $a0 = ((y + x) + ( x + ((m + x) - b))) + 0
	li $v0, 1		# load immediate 1; instruction to print integer in $v0
	syscall			# print to screen
	j END			# jump to END

SUM: 	#prologue
	addi $sp, $sp, -4	#jal drops you here. We are making space in the stack for 3 arguments (0, 4, 8 & 12)
	sw $ra, 0($sp)		# push bottom value for $ra because we know we will call SUB
	sw $s0, 4($sp)		# push value for input of x into stack
	#original SUM
	la $t0, m		# load address of m into $t0
	lw $s0, 0($t0)		# s0 = m
	add $a0, $s0, $a0	# Update a0 as new argument for SUB; $a0 = m + x
	jal SUB			# jump to SUB and store the next line address into $ra
	lw $a0, 4($sp)		# added here so that it wont interfere when  the argument register is used again in the next line $a0 = x
	add $v0, $a0, $v0	# current $ra will return here. Return register $v0 stores argument register $a0 + $v0. $v0 = x + ((m + x) - b) 
	#epilogue
	lw $ra, 0($sp)		# pop value	 $ra = MAIN return
	lw $s0, 4($sp)		# pop top value. $s0 = x; added here
	addi $sp, $sp, 4	# popping 4 out of stack (0, 4, 8 & 12)
	#sub $v0, $v0, $a0	# $v0 = return register $v0 + argument register $a0. $v0 = ( x + ((m + x) - b)) 
	jr $ra			# jump to MAIN $ra
		
SUB:	la $t0, b		# load address of b into temporary register $t0
	addi $sp, $sp -4	# pushing 4 into stack(0, 4, 8, 12 & 16)
	sw $s0, 0($sp)		# Backup s0 from SUM. Backed-up up m
	lw $s0, 0($t0)		# s0 = b
	sub $v0, $a0, $s0	# subtract  argument register $a0 from saved register $s0 and store into return register $v0 = ((m + x) - b)
	lw $s0, 0($sp)		# Restore s0 from SUM. $s0 = m
	addi $sp, $sp 4		# poping the stack (0, 4, 8 & 12)
	jr $ra			# jump to SUM $ra 
		
END:	li $v0, 10		# load immediate 10; instruction to terminate program
	syscall			# program terminated
