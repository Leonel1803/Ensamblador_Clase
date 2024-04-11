.data
	# Definir la matriz A
	matriz_A:
	    .word 2, 0, 1
	    .word 3, 0, 0
	    .word 5, 1, 1
	
	# Definir la matriz B
	matriz_B:
	    .word 1, 0, 1
	    .word 1, 2, 1
	    .word 1, 1, 0
	
	# Definir la matriz R para almacenar el resultado
	matriz_R:
	    .word 0, 0, 0
	    .word 0, 0, 0
	    .word 0, 0, 0
	    
.text
	addi s3, zero, 3 #Valor de 'n'

	# Cargamos los registros
	lui s0, %hi(matriz_A)
	addi s0, s0, %lo(matriz_A)
	
	lui s1, %hi(matriz_B)
	addi s1, s1, %lo(matriz_B)
	
	lui s2, %hi(matriz_R)
	addi s2, s2, %lo(matriz_R) 
	
	addi t0, zero, 0 #Itera en el FOR
	addi t1, zero, 0 #Recorre el arreglo
	mul t2, s3, s3 #Limite del FOR
	
	for:
		bge t0, t2, endfor #Si se supera la n entonces se termina el for
	
		slli t1, t0, 2 #Recorreremos los 3 arreglos cada 4 bytes
		add s4, s0, t1
		add s5, s1, t1
		add s6, s2, t1
		
		lw t4, 0(s4)
		lw t5, 0(s5)
		add t6, t4, t5
		sw t6, 0(s6)
		
		addi t0, t0, 1
		
		jal for
		
	endfor: nop
	