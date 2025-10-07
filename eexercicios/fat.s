    .text
    .globl _start

# --------------------------
# Função Fatorial (recursiva)
# Entrada: a0 = n
# Saída:   a0 = n!
# --------------------------
fatorial:
    addi sp, sp, -16       # reserva espaço na pilha
    sw ra, 12(sp)          # salva endereço de retorno
    sw a0, 8(sp)           # salva n

    li t0, 1               # t0 = 1
    beq a0, t0, caso_base  # se n == 1 → retorna 1
    beqz a0, caso_base     # se n == 0 → retorna 1

    addi a0, a0, -1        # a0 = n - 1
    jal ra, fatorial       # chamada recursiva fatorial(n-1)

    lw t1, 8(sp)           # carrega n original
    mul a0, a0, t1         # a0 = (n-1)! * n

    j fim_fat

caso_base:
    li a0, 1               # fatorial(0 ou 1) = 1

fim_fat:
    lw ra, 12(sp)          # restaura ra
    addi sp, sp, 16        # libera pilha
    jalr zero, 0(ra)       # retorna
