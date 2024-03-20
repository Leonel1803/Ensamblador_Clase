.text
	# Inicialización de variables
	addi a2, zero, 3       # Número de discos (modificable)
	addi a6, zero, 0       # Bits recorridos
	addi t0, zero, 0       # Iterador para generar los discos
	
	# Inicialización de punteros a las torres A, B y C
	lui s0, 0x10010         # Dirección de la torre A
	addi s0, s0, 0
	lui s1, 0x10010         # Dirección de la torre B
	addi s1, s1, 32       # Asumiendo que la torre B está 0x20 bytes después de la torre A
	lui s2, 0x10010         # Dirección de la torre C
	addi s2, s2, 64     # Asumiendo que la torre C está 0x30 bytes después de la torre A
	
	add a3, zero, s0
	add a4, zero, s1
	add a5, zero, s2
	add t1, zero, s0
	
	for:
		addi t0, t0, 1
		sw t0, 0(t1)
		addi t1, t1, 4
		addi a6, a6, 4
		
		bne t0, a2, for
	
	# Llamada inicial a la función recursiva para resolver las Torres de Hanoi
	jal hanoi
	
	#Llama a la finalización del código
	jal endcode
	
	hanoi:
		addi t1, zero, 1
		bne a2, t1, recursividad
		
		lw t0, 0(a3)
		sw zero, 0(a3)
		
		sw t0, 0(a5)
		
		jalr ra
		
		recursividad:
			add t2, zero, a3 # source
			add t3, zero, a4 # reference
			add t4, zero, a5 # destination
		
			#push -> ra, a2
			addi sp, sp, -4
			sw ra, 0(sp)
			addi sp, sp, -4
			sw a2, 0(sp)
			# mod args -> -1
			addi a2, a2, -1
			add a4, zero, t4
			add a5, zero, t3
			jal hanoi
			#pop <-
			lw a2, 0(sp)
			addi sp, sp, 4
			lw ra, 0(sp)
			addi sp, sp, 4	
			
			add t5, zero, t2
			add t6, zero, t4
			
			add t5, t5, a6
			
			lw t0, 0(t5)
			sw zero, 0(t5)
			
			sw t0, 0(t6)	
			
			addi a6, a6, -4
					
			#push -> ra, a2
			addi sp, sp, -4
			sw ra, 0(sp)
			addi sp, sp, -4
			sw a2, 0(sp)
			# mod args -> -1
			addi a2, a2, -1
			add a5, zero, t2
			add a3, zero, t4
			jal hanoi
			#pop <-
			lw a2, 0(sp)
			addi sp, sp, 4
			lw ra, 0(sp)
			addi sp, sp, 4	
	endcode: nop