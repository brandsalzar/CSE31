		.data
x:		.word 5
y:		.word 10

		.text
main:	la $t0, x	#store address of x into $t0
	lw $s0, 0($t0)	# s0 = x
	la $t0, y	#load adress of y into $t0
	lw $s1, 0($t0) 	# s1 = y
	# Prepare to call sum(x)
	add $a0, $zero, $s0	# Set a0 as input argument for SUM. $a0 = x
	add $a1, $zero, $s1	# Set a1 as input argument for SUM. $a1 = y
	jal sum			#jump to sum and store address of next lin in $ra
	add $t0, $s1, $s0	# $t0 = y + x
	add $s1, $t0, $v0	# y = (y + x) + $v0
	
	addi $a0, $s1, 0 #This is done to be able to proint our final answer as we need the argument to print our y
	li $v0, 1	#load imediate 1 into return register $v0 to print out the value of integer
	syscall
	
	j end
	
sum:	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $s0, 12($sp)
	sw $s1, 16($sp)
	#sw $v0, 20($sp)
	
	addi $a0, $a0, 1	# m = x; m = (m+1)
	addi $a1, $a1, 1	# n = y; n = (n+1)
	jal sub
	add  $s0, $v0, $zero	# s0 = p; a = (n+1); b = (m+1); $v0 = (b-a); p = $v0; p = (m+1)-(n+1)
	
	sw $v0, 20($sp)	#store the value of our retun value in the stack
	lw $a0, 4($sp)	#$a0 = y
	lw $a1, 8($sp)	#$a1 = x
	addi $a0, $a0, -1	# m = x; m = (m-1)
	addi $a1, $a1, -1	# n = y; n = (n-1)
	#switch the arguments
	add $t0, $a0, $zero	# $t0 = (m-1)
	add $t1, $a1, $zero	# $t1 = (n-1)
	move $a0, $t1	# $a0 = (n-1)
	move $a1, $t0	# $a1 = (m-1)	
		
	jal sub
	add $s1, $v0, $zero	#s1 = q; a = (m-1); b = (n-1); $v0 = (b-a); q = $v0; q = (n-1)-(m-1)
	
	lw $t0, 20($sp)
	add $v0, $t0, $v0
	lw $ra, 0($sp)
	lw $s0, 12($sp)
	lw $s1, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra		#return to main
	
sub:	#addi $sp, $sp, -4
	#how will you account for the change in parameters here?
	sub $t0, $a1, $a0	#$t0 = b-a; since $a0 = a and $a1 = b.
	add $v0, $t0, $zero	#store our value into our return register
	
	#addi $sp, $sp, 4
	jr $ra
	
end: 	li $v0, 10	#load immediate 10 into return register $v0 to terminate program
	syscall		#terminate program
#1. Local variables mapping:
#a. main(): x -> $s0, y -> $s1
#b. sum(): p -> $s0, q -> $s1
#2. Input arguments mappings:
#a. sum(): m -> $a0, n-> $a1
#b. sub(): a -> $a0, b-> $a1
#3. All return values from a function must be stored in V 
#registers in ascending order (i.e. $v0, $v1).
#4. Use of stack memory according to register convention.
#Save your program as proc3.s
