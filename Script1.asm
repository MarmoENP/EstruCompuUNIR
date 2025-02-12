# Pide al usuario tres números y encuentra el mayor entre ellos

.data
prompt: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
newline: .asciiz "\n"
max_msg: .asciiz "El número mayor es: "
input1: .word 0
input2: .word 0
input3: .word 0
max: .word 0

.text
main:
    # Pide al usuario el primer número
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee el primer número
    li $v0, 5
    syscall
    sw $v0, input1

    # Pide al usuario el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall

    # Lee el segundo número
    li $v0, 5
    syscall
    sw $v0, input2

    # Pide al usuario el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall

    # Lee el tercer número
    li $v0, 5
    syscall
    sw $v0, input3

    # Compara los números para encontrar el mayor
    lw $t0, input1
    lw $t1, input2
    lw $t2, input3
    bgt $t0, $t1, check_t2
    move $t0, $t1
check_t2:
    bgt $t0, $t2, done
    move $t0, $t2
done:
    # Muestra el mensaje "El número mayor es: "
    li $v0, 4
    la $a0, max_msg
    syscall

    # Muestra el número mayor
    li $v0, 1
    move $a0, $t0
    syscall

    # Salir del programa
    li $v0, 10
    syscall
    