.data
	vector1: .word 1 2 3 4 5 6 7 8 9
	vector2: .word -1 2 -3 4 -5 6 -7 8 -9
	
.text
	lui s0, %hi(vector1)
	addi s0, s0, %lo(vector1) # Crear apuntador al array 1
	
	lui s1, %hi(vector2)
	addi s1, s1, %lo(vector2) 

	addi t0, zero, 9 # limite del for
	addi t1, zero, 0 # iterador
	addi t3, zero, 0 # recorrera el arreglo
	addi s2, zero, 0 # resultado
	
	for: 	bge t1, t0, endfor # Por lo general, las condiciones planteadas en C, es mejor negarlas en ensamblador
		
		add t2, s0, t3 # Recorremos el arreglo según el número de iteración
		add t4, s1, t3
		
		lw a2, 0(t2)
		lw a3, 0(t4)
		
		addi t3, t3, 4
		addi t1, t1, 1
		
	 	jal productoPunto
	 	
	 	add s2, s2, a0
	 	
		jal for
		
	endfor: nop
	
	productoPunto:
		mul a0, a2, a3 # valor de retorno
		jalr ra
		
		
