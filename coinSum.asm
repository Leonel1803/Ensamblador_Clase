#int count(int coins[], int n, int sum)
#{
#    if (sum == 0)
#        return 1;
#
#    if (sum < 0)
#        return 0;
# 
#    if (n <= 0)
#        return 0;
#
#    return count(coins, n - 1, sum) + count(coins, n, sum - coins[n - 1]);
#}

 # [1, 2, 3] -> sum = 5 -> resultado es 5

#main
# count(arr, 3, 5) => 5

.text
	lui s1, 0x10010 # declarar apuntador al arreglo
	
	addi t0, zero, 1
	sw t0, 0(s0)
	
	addi, s1, s1, 4
	addi t0, zero, 2
	sw t0, 0(s0)
	
	addi, s1, s1, 4
	addi t0, zero, 3
	sw t0, 0(s0)
	
	addi a2, zero, 3 # n
	addi a3, zero, 5 # sum
	
	jal count
	jal endcode

	count:
		bne a3, zero, case0
		bgeu a3, zero, case1
		
	default:
		#push -> ra, a2
		addi sp, sp, -4
		sw ra, 0(sp)
		addi sp, sp, -4
		sw a2, 0(sp)
		# mod args -> -1
		addi a2, a2, -1
		jal count
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
		# mod args -> -2
		lw t5, -4(s0)
		sub a3, a3, t5
		jal count
		#pop <-
		lw a3, 0(sp)
		addi sp, sp, 4
		lw ra, 0(sp)
		addi sp, sp, 4
		
		jalr ra
		
	case0:	add a0, a0, zero
		jalr ra
		
	case1:	addi a0, a0, 1
		jalr ra
	
	endcode: nop