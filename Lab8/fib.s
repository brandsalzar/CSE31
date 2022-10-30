        .data
        .word
#n:      .word 13
strNum: .asciiz "\n Please enter a number: \n"

        .text
main: 	li   $v0, 4		#Print out "Please enter the value of:"
       	la   $a0, strNum
       	syscall	
                   
       	li $v0, 5		#User input
       	syscall		
       	move $t3, $v0		#store the user input in $t0

	add     $t0, $0, $zero
	addi    $t1, $zero, 1
	#la      $t3, n
	#lw      $t3, 0($t3)
		
fib: 	beq     $t3, $0, finish
		add     $t2,$t1,$t0
		move    $t0, $t1
		move    $t1, $t2
		subi    $t3, $t3, 1
		j       fib
		
finish: addi    $a0, $t0, 0
		li      $v0, 1		
		syscall			
		li      $v0, 10		
		syscall			

