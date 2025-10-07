# --------------------------
# Função Potenciação
# Entrada: a0 = base, a1 = expoente
# Saída:   a0 = base^expoente
# --------------------------
potencia:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 8(sp)             # salva base
    sw a1, 4(sp)             # salva expoente

    beqz a1, caso_base_pot   # se expoente == 0 → retorna 1

    addi a1, a1, -1
    jal ra, potencia         # chama potencia(base, exp-1)

    lw t0, 8(sp)             # carrega base
    mul a0, a0, t0           # a0 = base * potencia(base, exp-1)
    j fim_pot

caso_base_pot:
    li a0, 1                 # qualquer número^0 = 1

fim_pot:
    lw ra, 12(sp)
    addi sp, sp, 16
    jalr zero, 0(ra)
