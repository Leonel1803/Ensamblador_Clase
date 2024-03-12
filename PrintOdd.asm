#int main()
#{
#	# Print odd numbers in the range 1 to n
#	int n = 10;
#	int startVal = 1;
#	printOdd(startVal, n);
#	return 0;
#}

#void printOdd(int startVal, int n)
#{
#	if(startVal > n) != if(startVal <= n) 
#		return;
#	printf("%d ", startVal);
#	printOdd(startVal + 2, n);
	# hacen algo con el arg -> stack
#	return;
#}

.text
	lui s0, 0x10010
	addi s0, s0, 0x000
	addi a2, zero, 10 #a2 en adelante es para paraámetros, a0 y a1 es para returns 
	addi a3, zero, 1
	
	jal printOdd
	jal endcode
	
	printOdd:
		bge a2, a3, continue
		jalr ra #return
		
		continue:
			sw a3, 0(s0) # Simular print con array
			addi s0, s0, 4
			
			#push
			addi sp, sp, -4
			sw ra, 0(sp)
			
			#modificr argumentos
			addi a3, a3, 2
			
			#recursion
			jal printOdd
			
			#pop
			lw ra, 0(sp)
			addi sp, sp, 4
			
			jalr ra
	
	endcode: nop