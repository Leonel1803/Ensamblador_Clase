.text
	addi a2, zero, 100
	jal numOfDig
	jal endcode
	
	numOfDig:
		beq a2, zero, return
		addi t0, zero, 10
		addi a0, a0 , 1
		
		addi, sp, sp, -4
		sw ra, 0(sp)
		div a2, a2, t0
		jal numOfDig
		lw, ra, 0(sp)
		addi sp, sp, 4
		
	return:
		jalr ra
	
	endcode: nop