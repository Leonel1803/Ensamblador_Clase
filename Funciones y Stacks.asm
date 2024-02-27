.text

addi a2, zero, 1
addi a3, zero, 2
addi a4, zero, 3
addi a5, zero, 4
jal addingNumbers

# Push de a0 al stack
addi sp, sp, -4 # Hacer espacio en el stack
sw a0, 0(sp) # Push al stack

addi a2, zero, 1
addi a3, zero, 2
addi a4, zero, 3
addi a5, zero, 4
jal addingNumbers

# Pop de a0 del stack
lw t6, 0(sp)
addi sp, sp, 4

add s0, a0, t6

jal endcode

addingNumbers: 
	add a0, a2, a3
	add a0, a0, a4
	add a0, a0, a5
	jalr ra # return
	
endcode: nop