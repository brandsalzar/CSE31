	.data
n:	.word 25
str1:	.asciiz "Less than \n"
str2:	.asciiz "Less than or equal to\n"
str3:	.asciiz "Greater than\n"
str4:	.asciiz "Greater than or equal to\n"
	
	.text
main:	la $t0, n	#assign the address
	lw $t0, 0($t0)  #load the value

	li $v0, 5	# user input
	syscall		
	move $t1, $v0	#store the user input in $t1
	
comp:	#slt $t2, $t1, $t0	# Storing the result of the comparison if user inout is less than n
	#bne $t2, $0, L		# If the $t2 is false then jump to "less than" function
	#beq $t2, $0, GE	# If the $t2 is true then jump to "greater than or equal" function
	
	slt $t2, $t0, $t1	# Storing the result of the comparison if n is less than user input
	bne $t2, $zero,  G	# If the $t2 is false then jump to "greater than" function
	beq $t2, $zero, LE	# If the $t2 is true then jump to "Less than or equal" function
	
	
finish: li      $v0, 10		
	syscall	
	
L:	li	$v0, 4
	la	$a0, str1
	syscall	
	j	finish
		
LE:	li	$v0, 4
	la	$a0, str2
	syscall
	j	finish	
		
	
G:	li	$v0, 4
	la	$a0, str3
	syscall	
	j	finish
			
GE:	li	$v0, 4
	la	$a0, str4
	syscall	
	j	finish
	
	