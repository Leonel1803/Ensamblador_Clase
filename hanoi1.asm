.text
    addi x12, x0, 0      # Inicializar contador de iteración

    # Inicialización del número de discos en la torre origen (el usuario selecciona el número)
    addi t0, x0, 5        # Número predeterminado de discos (puedes cambiarlo)
    add x9, x0, t0        # Inicializar x9 con el número de discos

    # Declarar apuntador al arreglo de resultados (simulación de impresión)
    lui x11, 0x10010
    addi x11, x11, 0

# Bucle principal
for:
    bge x12, x9, endfor   # Si hemos realizado suficientes iteraciones, terminar

    # Iniciar la resolución de las Torres de Hanoi para el número actual de discos
    add x5, x0, x9        # Cantidad de discos en esta iteración
    addi x6, x0, 1        # Torre de origen
    addi x7, x0, 2        # Torre de destino
    addi x10, x0, 3       # Torre auxiliar
    jal x0, hanoi         # Llamar a la función hanoi

    # Simular "print" almacenando el resultado en un arreglo
    sw x5, 0(x11)
    addi x11, x11, 4      # Mover el apuntador a la siguiente posición en el arreglo

    addi x12, x12, 1      # Incrementar el contador de iteración
    jal x0, for
endfor:
    jal x0, endcode        # Fin del programa

# Función recursiva para resolver las Torres de Hanoi
# int hanoi(int n, int from, int to, int aux)
hanoi:
    addi x4, x0, 0        # Usaremos x4 como bandera para el caso base

    addi x8, x0, -1       # n - 1
    beq x5, x0, base_case  # Verificar si hay discos

    jal x0, hanoi         # Mover n-1 discos de la torre origen a la torre auxiliar

    sw x6, 0(x2)          # Guardar registros
    sw x7, -4(x2)
    sw x10, -8(x2)
    sw x8, -12(x2)

    addi x2, x2, -16      # Reservar espacio en la pila

    add x5, x0, x8        # Cantidad de discos restantes
    add x6, x0, x6        # Torre de origen
    add x7, x0, x10       # Torre de destino
    add x10, x0, x7       # Torre auxiliar

    jal x0, hanoi         # Mover el disco restante de la torre origen a la torre destino

    lw x10, -8(x2)        # Restaurar registros
    lw x7, -4(x2)
    lw x6, 0(x2)
    lw x8, -12(x2)

    addi x2, x2, 16       # Limpiar la pila

    addi x8, x0, -1       # n - 1
    jal x0, hanoi         # Mover n-1 discos de la torre auxiliar a la torre destino

    add x1, x0, x6        # Guardar en un registro temporal (usamos x1) el valor de retorno
    addi x2, x2, 16       # Eliminar marco de pila de esta llamada
    lw x6, 0(x2)          # Restaurar registros desde el marco de pila de la llamada anterior
    lw x7, 4(x2)
    lw x10, 8(x2)
    lw x8, 12(x2)
    addi x2, x2, 16       # Eliminar marco de pila de esta llamada
    addi x12, x12, 0      # Retornar de la llamada recursiva (efectivamente, omitiendo la recursión)

base_case:
    add x9, x0, x6        # Devolver la torre de origen

    add x1, x0, x9        # Guardar en un registro temporal (usamos x1) el valor de retorno
    addi x2, x2, 16       # Eliminar marco de pila de esta llamada
    lw x6, 0(x2)          # Restaurar registros desde el marco de pila de la llamada anterior
    lw x7, 4(x2)
    lw x10, 8(x2)
    lw x8, 12(x2)
    addi x2, x2, 16       # Eliminar marco de pila de esta llamada
    addi x12, x12, 0      # Retornar de la llamada recursiva (efectivamente, omitiendo la recursión)

endcode:
    nop
