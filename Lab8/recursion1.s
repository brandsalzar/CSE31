	.data
	.word
str: 	.asciiz "\nPlease enter an integer: \n"
	.text

main: 		li $v0, 4	#load function for the print function
		la $a0, str	#load the adress of str into $a0 to print 
		syscall		#print call
			
		li $v0, 5	#preparing input function
		syscall		#receiving input
		move $a0, $v0	#Moving our value from $v0 into $a0 for when we pass it as our argument
	
		jal recursion
		
		addi $sp, $sp, -4
		
		sw $v0, 4($sp)	#move $s0, $v0
		lw $t0, 4($sp)
		
		li $v0, 1		#loading print integer function
		add $a0, $zero, $t0	#load the value to be printed
		syscall			#print the integer
		
		addi $sp, $sp, 4
		j end
	
recursion: 	addi $sp, $sp, -12	#Push space in the stack
		sw $ra, 0($sp)		#store our return for our main function
		
		addi $t0, $zero, 10	#what it will be compared to
		bne $a0, $t0, noTEN	#branch if (!m == 10)
		
		li $v0, 2		#return 2;
		
		j endRECUR
		
noTEN:		addi $t0, $zero, 11		#what it will be compared to
		bne  $a0, $t0, noELEVEN 	#branch if(!m == 11)
	
		li $v0, 1			#return 1;
	
		j endRECUR
	
noELEVEN:	sw $a0, 4($sp)	#storing the value of our argument for when we need it again
		
		addi $a0, $a0, 2	#$t0 = m + 2
		
		jal  recursion 	
		
		lw $t0, 4($sp)	#load the argument value into a $t0
		add  $v0, $v0, $t0	#$a0 = (m + 2) + m
		
		sw $v0, 8($sp)	#save our return to the stop of the stack
		
		lw $a0, 4($sp)	#restore values to call other side of recursion. $a0 = m
		addi $a0, $a0, 1#$a0 = (m+1)
		
		jal recursion
		
		lw $a0, 4($sp)  #restore original value as it is CONVENTIONAL
		lw $t0, 8($sp)	#return from other side of recursion is stored in $t0
		
		add $v0, $v0, $t0
		
		j endRECUR
		
endRECUR:	lw $ra, 0($sp)	#to return to main
		#sw $v0, 8($sp)
		addi $sp, $sp, 12 #pop stack as CONVENTION
		jr $ra
		
end: 		li $v0, 10	#load function to end program
		syscall		#end program
	
#Study recursion1.c and translate the same program in MIPS 
#following register convention. You can compare the output 
#of your MIPS program with that of recursion1.c. Save your 
#program as recursion1.s