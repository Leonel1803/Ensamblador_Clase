# Fibonacci series algortihm
#int main() 
#{
#   int n = 5;
#
#   for(int i = 0; i<n; i++) 
#   {
#					 # add a0, zero, zero
#      printf("%d ",fibonacci(i));      # jal  fibonacci
					 # sw a0, 0(arr) para simular print  
#   }
#   return 0;
#}

# int fibonacci(int n) 
#{
#   if(n == 0)
#      return 0;			# addi a0, a0, 0
#   else if(n == 1) 
#      return 1;			# addi a0, a0, 1
#   else 
#      return (fibonacci(n-1) + fibonacci(n-2));|	# jalr ra
#}

.text
	addi s0, zero, 5 #-> limite del for
	addi a2, zero, 0
	lui s1, 0x10010 # declarar apuntador al arreglo
	addi s1, s1, 0
	
for: bge a2, s0, endfor

	add a0, zero, zero
	jal fibonacci	# iniciar recursion
	sw a0, 0(s1)	# simular print con arreglo
	addi s1, s1, 4 	# mover el apuntador a la siguiente posicion
	
	addi a2, a2, 1
	jal for
	
endfor:	jal endcode

fibonacci: beq a2, zero, case0
	addi t0, zero, 1
	beq a2, t0, case1
default:
	#push -> ra, a2
	addi sp, sp, -4
	sw ra, 0(sp)
	addi sp, sp, -4
	sw a2, 0(sp)
	# mod args -> -1
	addi a2, a2, -1
	jal fibonacci
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
	addi a2, a2, -2
	jal fibonacci
	#pop <-
	lw a2, 0(sp)
	addi sp, sp, 4
	lw ra, 0(sp)
	addi sp, sp, 4
	
	addi t3, a0, 0
	
	jalr ra
	
case0:	add a0, a0, zero
	jalr ra
case1:	addi a0, a0, 1
	jalr ra

endcode: nop
		
	
