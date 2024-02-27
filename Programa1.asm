# Mi primer programa en ensamblador
.data
	A: .word 0 1 2 3 4 5

.text
	# Cargamos los registro
	addi t0, zero, 2 # Se usa addi cuando es inmediato y no un registro NOTA: "zero" es literalmente cero.
	addi t1, zero, 4
	
	# Este es el if
	bne t0, zero, else
	# Hacemos las sumas
		if: add s0, t0, t1 # Se usa cuando ya hay constantes
		jal endif # Debido a que no se ejecuto lo del else, se hace lo del if y desoués se va al final de las dos condicicones
	
	# Este es el else
	# Ahora resta NOTA: no se puede  hacer restas con inmediatos, pero sí se pueden hacer sumas con negativos (lo cual indirectamente es una resta)
		else: sub s0, t0, t1
		
		endif: nop