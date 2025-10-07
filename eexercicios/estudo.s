    .data
valor:  .word 10             # variável na memória (valor inicial 10)

    .text
    .globl _start
_start:

    # =====================================================
    # Instruções Aritméticas Imediatas
    # =====================================================
    addi a0, zero, 5         # a0 = 0 + 5 → carrega o número 5 em a0
    addi a1, a0, 10          # a1 = a0 + 10 → soma imediato
    slti a2, a0, 10          # a2 = 1 se a0 < 10 (signed), senão 0
    sltiu a3, a0, 10         # a3 = 1 se a0 < 10 (unsigned), senão 0
    xori a4, a1, 3           # a4 = a1 XOR 3
    ori  a5, a0, 8           # a5 = a0 OR 8
    andi a6, a1, 7           # a6 = a1 AND 7
    slli t0, a0, 2           # t0 = a0 << 2 (desloca bits para esquerda)
    srli t1, a1, 1           # t1 = a1 >> 1 lógico (coloca 0 no bit mais à esquerda)
    srai t2, a1, 1           # t2 = a1 >> 1 aritmético (preserva sinal)

    # =====================================================
    # Instruções Aritméticas entre Registradores
    # =====================================================
    add t3, a0, a1           # t3 = a0 + a1
    sub t4, a1, a0           # t4 = a1 - a0
    sll t5, a0, a1           # t5 = a0 << (a1 & 0x1F)
    srl t6, a1, a0           # t6 = a1 >> (a0 & 0x1F), lógico
    sra s0, a1, a0           # s0 = a1 >> (a0 & 0x1F), aritmético
    and s1, a0, a1           # s1 = a0 AND a1
    or  s2, a0, a1           # s2 = a0 OR a1
    xor s3, a0, a1           # s3 = a0 XOR a1
    slt s4, a0, a1           # s4 = 1 se a0 < a1 (signed), senão 0
    sltu s5, a0, a1          # s5 = 1 se a0 < a1 (unsigned), senão 0

    # =====================================================
    # Instruções de Memória
    # =====================================================
    la   s6, valor           # carrega endereço de "valor" em s6
    lw   s7, 0(s6)           # s7 = Mem[s6] → carrega palavra da memória
    sw   a0, 0(s6)           # Mem[s6] = a0 → salva a0 na memória
    lb   t0, 0(s6)           # carrega byte com sinal
    lbu  t1, 0(s6)           # carrega byte sem sinal
    lh   t2, 0(s6)           # carrega halfword (16 bits) com sinal
    lhu  t3, 0(s6)           # carrega halfword sem sinal
    sb   t0, 0(s6)           # salva byte
    sh   t1, 0(s6)           # salva halfword

    # =====================================================
    # Instruções de Desvio Condicional
    # =====================================================
    beq a0, a1, label_iguais # se a0 == a1, salta para label_iguais
    bne a0, a1, label_diff   # se a0 != a1, salta para label_diff
    blt a0, a1, label_menor  # se a0 < a1 (signed), salta
    bge a0, a1, label_maior  # se a0 >= a1 (signed), salta
    bltu a0, a1, label_menorU# se a0 < a1 (unsigned), salta
    bgeu a0, a1, label_maiorU# se a0 >= a1 (unsigned), salta
    ble a0, a1, a0_é_maior  # se x2 >= x1 → salta

    # =====================================================
    # Instruções de Jump
    # =====================================================
    jal ra, funcao           # chama "funcao", salva retorno em ra
    jalr zero, 0(ra)         # retorna para o endereço salvo em ra

label_iguais:
    addi a0, zero, 111       # se iguais → a0 = 111
    j fim

label_diff:
    addi a0, zero, 222       # se diferentes → a0 = 222
    j fim

label_menor:
    addi a0, zero, 333       # se menor → a0 = 333
    j fim

label_maior:
    addi a0, zero, 444       # se maior ou igual → a0 = 444
    j fim

label_menorU:
    addi a0, zero, 555       # unsigned menor
    j fim

label_maiorU:
    addi a0, zero, 666       # unsigned maior/igual
    j fim

# =====================================================
# Exemplo de Função
# =====================================================
funcao:
    addi a0, a0, 99          # modifica a0 (só para exemplo)
    jalr zero, 0(ra)         # volta para quem chamou

# =====================================================
# Fim do programa
# =====================================================
fim:
    li a7, 93                # syscall: exit
    ecall


# =====================================================

sp = stack pointer
ex:
addi sp, sp, -16   # move o ponteiro 16 bytes "para baixo"


ra = return adress
ex:
jal ra, funcao   # chama "funcao", guarda retorno em ra

