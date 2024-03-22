.text
	# Inicializaci�n de variables
	addi a2, zero, 3        # N�mero de discos (modificable)
	addi s9, zero, 3	# numero de discos (no modificable)
	addi t0, zero, 0        # Iterador para generar los discos
	
	# Inicializaci�n de punteros a las torres A, B y C
	lui a3, 0x10010         # Direcci�n de la torre A
	addi a3, a3, 0
	lui a4, 0x10010         # Direcci�n de la torre B
	addi a4, a4, 32         # Asumiendo que la torre B est� 0x20 bytes despu�s de la torre A
	lui a5, 0x10010         # Direcci�n de la torre C
	addi a5, a5, 64         # Asumiendo que la torre C est� 0x30 bytes despu�s de la torre A
	
	add t6, zero, a3
	
	for:
		addi t0, t0, 1
		sw t0, 0(t6)
		addi t6, t6, 4
		
		bne t0, a2, for
	
	# Llamada inicial a la funci�n recursiva para resolver las Torres de Hanoi
	jal hanoi
	
	#Llama a la finalizaci�n del c�digo
	jal endcode
	
	hanoi:
		addi t1, zero, 1
		bne a2, t1, recursividad
		
		#OFFSET DE NUESTRA TORRE 1 (a3)
		sub t2,s9,a2 #s9-a2
		slli s2,t2,2 #guardamos en s2 el resultado de 4*(s7-a2)
		add s3,a3,s2 #guardamos en s3 el resultado final de s3 + 4*(s7-a2)
		    
		#OFFSET DE NUESTRA TORRE 3 (a5)
		sub t4,s9,a2  #s9-a2
		slli s5,t4,2 #guardamos en s2 el resultado de 4*(s7-a2)
		add s6,a5,s5 #guardamos en s3 el resultado final de s3 + 4*(s7-a2)
		    
		#movemos los discos con sus respectivos offsets (de a3 a a5)
		lw s4,0(s3) #sacamos el disco de la torre 1 con su respectivo offset y lo guardamos en s4
		sw zero,0(s3) #escribimos 0 en la posicion del disco que recien sacamos para leer
		sw s4,0(s6) #guardamos el valor de a4 en nuestra torre 3 con su respectivo offset
		
		jalr ra
		
		recursividad:
			#push -> ra, a2
			addi sp, sp, -20
			sw ra, 4(sp)
			sw a2, 8(sp)
			sw a3, 12(sp)
			sw a4, 16(sp)
			sw a5, 20(sp)
			# mod args -> -1
			addi a2, a2, -1
			
			add t3, a4, zero
			
			add a4,a5,zero # a4=a5
    			add a5,t3,zero # s5=t3(a4)
			jal hanoi
			#pop <-
			lw a5, 20(sp)
			lw a4, 16(sp)
			lw a3, 12(sp)
			lw a2, 8(sp)
			lw ra, 4(sp)
			addi sp, sp, 20
			
			#OFFSET DE NUESTRA TORRE 1 (a3)
			sub t2,s9,a2 #s9-a2
			slli s2,t2,2 #guardamos en s2 el resultado de 4*(s7-a2)
			add s3,a3,s2 #guardamos en s3 el resultado final de s3 + 4*(s7-a2)
			    
			#OFFSET DE NUESTRA TORRE 2(aS)
			sub t4,s9,a2  #s9-a2
			slli s5,t4,2 #guardamos en s2 el resultado de 4*(s7-a2)
			add s6,a5,s5 #guardamos en s3 el resultado final de s3 + 4*(s7-a2)
			    
			#movemos los discos con sus respectivos offsets (de a3 a a5)
			lw s4,0(s3) #sacamos el disco de la torre 1 con su respectivo offset y lo guardamos en s4
			sw zero,0(s3) #escribimos 0 en la posicion del disco que recien sacamos para leer
			sw s4,0(s6) #guardamos el valor de a4 en nuestra torre 3 con su respectivo offset
    
					
			#push -> ra, a2
			addi sp, sp, -20
			sw ra, 4(sp)
			sw a2, 8(sp)
			sw a3, 12(sp)
			sw a4, 16(sp)
			sw a5, 20(sp)
			# mod args -> -1
			addi a2, a2, -1
			
			add t3, a3, zero
			
			add a3,a4,zero # a3=a4
    			add a4,t3,zero # s5=t3(a3)
    			
			jal hanoi
			#pop <-
			lw a5, 20(sp)
			lw a4, 16(sp)
			lw a3, 12(sp)
			lw a2, 8(sp)
			lw ra, 4(sp)
			addi sp, sp, 20
			
			jalr ra
	endcode: nop
	
	
	
