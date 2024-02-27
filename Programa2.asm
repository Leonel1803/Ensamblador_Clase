# Mi segundo programa en ensamblador
.data
	A: .word 0 1 2 3 4 5

.text
	# Cargamos los registro
	addi t0, zero, 2 # Se usa addi cuando es inmediato NOTA: "zero" es literalmente cero.
	addi t1, zero, 4
	addi t2, zero, 0
	
	# Este es el switch
	beq t2, zero, case0
	addi t3, zero, 1
	
	beq t2, t3, case1
	addi t3, zero, 2
	
	beq t2, t3, case2
	
	jal default
	
	case0: add s0, t0, t1
		jal endswitch
		
	case1: sub s0, t0, t1
		jal endswitch	
		
	case2: or s0, t0, t1
		jal endswitch
		
	default: and s0, t0, t1
	
	endswitch: nop
	