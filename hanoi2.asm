.text
	# Inicializaci�n de variables
	addi a2, zero, 3        # N�mero de discos (modificable)
	addi t0, zero, 0        # Iterador para generar los discos
	
	# Inicializaci�n de punteros a las torres A, B y C
	lui a3, 0x10010         # Direcci�n de la torre A
	addi a3, a3, 0
	lui a4, 0x10010         # Direcci�n de la torre B
	addi a4, a4, 32         # Asumiendo que la torre B est� 0x20 bytes despu�s de la torre A
	lui a5, 0x10010         # Direcci�n de la torre C
	addi a5, a5, 64         # Asumiendo que la torre C est� 0x30 bytes despu�s de la torre A
	
	addi t3, zero, 0 	# Cantidad de discos en A
	addi t4, zero, 0 	# Cantidad de discos en B
	addi t5, zero, 0 	# Cantidad de discos en C
	
	for:
		addi t0, t0, 1
		sw t0, 0(a3)
		addi a3, a3, 4
		addi t3, t3, 4
		
		bne t0, a2, for
	
	# Llamada inicial a la funci�n recursiva para resolver las Torres de Hanoi
	jal hanoi
	
	#Llama a la finalizaci�n del c�digo
	jal endcode
	
	hanoi:
		addi t1, zero, 1
		bne a2, t1, recursividad
		
		lw t0, 0(a3)
		sw zero, 0(a3)
		
		sw t0, 0(a5)
		
		jalr ra
		
		recursividad:
			#push -> ra, a2
			addi sp, sp, -4
			sw ra, 0(sp)
			addi sp, sp, -4
			sw a2, 0(sp)
			# mod args -> -1
			addi a2, a2, -1
			jal hanoi
			#pop <-
			lw a2, 0(sp)
			addi sp, sp, 4
			lw ra, 0(sp)
			addi sp, sp, 4	
			
			
					
			#push -> ra, a2
			addi sp, sp, -4
			sw ra, 0(sp)
			addi sp, sp, -4
			sw a2, 0(sp)
			# mod args -> -1
			addi a2, a2, -1
			jal hanoi
			#pop <-
			lw a2, 0(sp)
			addi sp, sp, 4
			lw ra, 0(sp)
			addi sp, sp, 4	
	endcode: nop
	
	
	
