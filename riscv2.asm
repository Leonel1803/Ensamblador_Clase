.text
	addi a2, zero, 4
	jal factorial
	jal endcode

	factorial:
		addi t0, zero, 1
		beq a2, t0, else
		addi a0, zero, 1
		jalr ra
	else:
		addi sp, sp, -4
		sw ra, 0(sp)
		
		addi sp, sp, -4
		sw a2, 0(sp)
		
		addi a2, a2, -1
		jal factorial
		
		lw a2, 0(sp)
		addi sp, sp, 4
		
		lw ra, 0(sp)
		addi sp, sp, 4
		
		mul a0, a2, a0
		jalr ra
		
	endcode: nop