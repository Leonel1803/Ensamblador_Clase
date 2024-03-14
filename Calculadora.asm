.text
	addi s0, zero, 0 # selector
	addi s1, zero, 5 # a
	addi s2, zero, 3 # b
	addi s3, zero, 0 # c
	
	# sirven para no tener inmediatos
	addi t0, zero, 3
	addi t1, zero, 2
	addi t2, zero, 3

	# este es nuestro switch
	beq s0, t0, case1
	beq s0, t1, case2
	beq s0, t2, case3
	
	default:
		and s3, s1, s2
		jal endcode
	
	case1: 
		add s3, s1, s2
		jal endcode
		
	case2:
		sub s3, s1, s2
		jal endcode
		
	case3:
		mul s3, s1, s2
		jal endcode
		
	endcode: nop	
