	.data
	.word
strNum: .asciiz "Please enter a number:\n"
strPos:	.asciiz "Sum of positive numbers is:\n"
strNeg: .asciiz "\nSum of negative numbers is:\n"
	
	.text
while:	li   $v0, 4		#Print out "Please enter the value of:"
       	la   $a0, strNum
       	syscall	
                    
       	li $v0, 5		#User input
       	syscall		
       	move $t0, $v0		#store the user input in $t0
       	
       	beq, $t0, $zero, printSum		#Branch when $t0 is equal to 0
       	
       	bgt $t0, $zero, posSum		#Branch if greater than zero
       	blt $t0, $zero, negSum		#Branch if less than zero	
	
posSum: add $t2, $t2, $t0
	j while

negSum: add $t3, $t3, $t0
	j while
		
finish:	li      $v0, 10		
	syscall
	
printSum:
	li	$v0, 4
	la	$a0, strPos	#Print the "sum of all positive numbers"
	syscall	
	
	li	$v0, 1		#4
	la	$a0, 0($t2) 	#Print the positive sum 
	syscall	
	
	li	$v0, 4		#Print out "The sum of all negative numbers"
	la	$a0, strNeg
	syscall
	
	li	$v0, 1		#4 
	la	$a0, 0($t3)	#Print out Negative sum
	syscall		
	
	j finish