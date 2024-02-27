# Mi segundo programa en ensamblador
.data
	A: .word 0 1 2 3 4 5

.text
	# Cargamos los registro
	addi t0, zero, 2 
	addi t1, zero, 4
	addi t2, zero, 5 # Límite del for
	addi t3, zero, 0 # Este irá subiendo
	addi s0, zero, 0
	addi s1, zero, 0
	
	for: 	beq t3, t2, endfor # Por lo general, las condiciones planteadas en C, es mejor negarlas en ensamblador
	 	add s1, s1, t1
		add s0, s0, t0
		addi t3, t3, 1
		jal for
		
	endfor: nop
		
	
	
	
	
