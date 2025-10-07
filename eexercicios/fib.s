# --------------------------
# Função Fibonacci (recursiva)
# Entrada: a0 = n
# Saída:   a0 = Fib(n)
# --------------------------
fibonacci:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 8(sp)

    li t0, 1
    ble a0, t0, caso_base_fib # se n <= 1 → retorna n

    addi a0, a0, -1
    jal ra, fibonacci          # fib(n-1)
    sw a0, 4(sp)               # salva resultado fib(n-1)

    lw a0, 8(sp)               # recupera n
    addi a0, a0, -2
    jal ra, fibonacci          # fib(n-2)

    lw t1, 4(sp)               # carrega fib(n-1)
    add a0, a0, t1             # fib(n) = fib(n-1) + fib(n-2)
    j fim_fib

caso_base_fib:
    lw a0, 8(sp)               # retorna n (0 ou 1)

fim_fib:
    lw ra, 12(sp)
    addi sp, sp, 16
    jalr zero, 0(ra)
