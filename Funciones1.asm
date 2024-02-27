.text


addi a2, zero, 1
addi a3, zero, 2
addi a4, zero, 3
addi a5, zero, 4
jal addingNumbers
jal endcode

addingNumbers: 
	add a0, a2, a3
	add a0, a0, a4
	add a0, a0, a5
	jalr ra # return
	
endcode: nop