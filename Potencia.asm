.text
	addi a2, zero, 6 # n arg2
	addi a3, zero, 6 # m arg1
	
	jal potencia
	jal endcode
	
	potencia:
		addi t1, zero, 1 
    		
    		bge a2, t0, else
    		
    		#if true
    		addi a0, zero, 1
    		jalr ra
    		
    		else:	
	    		#push -> ra, a2
			addi sp, sp, -4
			sw ra, 0(sp)
			addi sp, sp, -4
			sw a2, 0(sp)
			# mod args -> -1
			addi a2, a2, -1
			jal potencia
			#pop <-
			lw a2, 0(sp)
			addi sp, sp, 4
			lw ra, 0(sp)
			addi sp, sp, 4
			
			mul a0, a2, a3
			
			jalr ra
	endcode: nop
			
	
