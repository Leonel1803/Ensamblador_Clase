.data
	arr1: .word 1 2 3 # Elementos del arreglo
	arr2: .word 4 5 6
	arr3: .word 0 0 0
	# Cada .word es 4 bytes
	
.text
	lui s0, %hi(arr1)
	addi s0, s0, %lo(arr1) # Crear apuntador al array 1
	
	lui s1, %hi(arr2)
	addi s1, s1, %lo(arr2) 
	
	lui s2, %hi(arr3)
	addi s2, s2, %lo(arr3) 
	
	lw t0, 0(s0) # t0 = arr1[0]
	lw t1, 0(s1) # t1 = arr2[0]
	
	add t3, t0, t1 # arr2[0] + arr1[0]
	
	sw t3, 0(s2) #arr3[0] = arr1[0] + arr2[0]
	
	
	lw t0, 4(s0) # t0 = arr1[1]
	lw t1, 4(s1) # t1 = arr2[1]
	
	add t3, t0, t1 # arr2[1] + arr1[1]
	
	sw t3, 4(s2) #arr3[1] = arr1[1] + arr2[1]
	
	
	lw t0, 8(s0) # t0 = arr1[2]
	lw t1, 8(s1) # t1 = arr2[2]
	
	add t3, t0, t1 # arr2[2] + arr1[2]
	
	sw t3, 8(s2) #arr3[2] = arr1[2] + arr2[2]