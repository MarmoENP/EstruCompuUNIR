# Genera la serie Fibonacci hasta un número dado por el usuario

.data
prompt: .asciiz "Ingrese un número para generar la serie Fibonacci: "
newline: .asciiz "\n"
comma: .asciiz ", "
fib_msg: .asciiz "Serie Fibonacci:"
input: .word 0
a: .word 0
b: .word 1
c: .word 0

.text
main:
    # Pide al usuario un número
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee el número
    li $v0, 5
    syscall
    sw $v0, input

    # Inicializa variables
    lw $t0, input
    sw $t0, c
    li $t1, 0
    sw $t1, a
    li $t1, 1
    sw $t1, b

    # Muestra el mensaje "Serie Fibonacci: "
    li $v0, 4
    la $a0, fib_msg
    syscall

loop:
    lw $t0, c
    li $v0, 1
    move $a0, $t0
    syscall

    # Muestra una coma si no es el último número de la serie
    lw $t1, input
    sub $t1, $t1, 1
    beq $t0, $t1, end_loop
    li $v0, 4
    la $a0, comma
    syscall

end_loop:
    # Calcula el siguiente número de Fibonacci
    lw $t1, a
    lw $t2, b
    add $t3, $t1, $t2
    sw $t2, a
    sw $t3, b
    sw $t3, c

    # Comprueba si se alcanzó el número dado por el usuario
    lw $t4, input
    ble $t3, $t4, loop

    # Salir del programa
    li $v0, 10
    syscall