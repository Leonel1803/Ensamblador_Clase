.data
	arr1: .word 1 2 3 # Elementos del arreglo
	arr2: .word 4 5 6
	arr3: .word 0 0 0
	# Cada .word es 4 bytes

.text
	# Cargamos los registro
	lui s0, %hi(arr1)
	addi s0, s0, %lo(arr1) # Crear apuntador al array 1
	
	lui s1, %hi(arr2)
	addi s1, s1, %lo(arr2) 
	
	lui s2, %hi(arr3)
	addi s2, s2, %lo(arr3) 
	
	addi t2, zero, 8 # Límite del for
	addi t3, zero, 0 # Este irá subiendo
	
	for: 	beq t3, t2, endfor # Por lo general, las condiciones planteadas en C, es mejor negarlas en ensamblador
	
		add t5, s0, t3
	
	 	lw t0, 0(t5) # t0 = arr1[i]
		lw t1, 0(t5) # t1 = arr2[i]
		
		add t4, t0, t1 # arr2[i] + arr1[i]
		add t5, t2, t3
		
		sw t5, 0(t5) #arr3[i] = arr1[i] + arr2[i]
		
		addi t3, t3, 4
	
		jal for
		
	endfor: nop