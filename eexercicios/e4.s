# Questão 4- Soma de Pares
# Soma todos os números pares no intervalo [1, N].

.data
N: .word 6      # ENTRADA: Altere este valor para 6, 10, 1, etc.

.text
.globl main

main:
    # --- Inicialização ---
    # Carrega o valor de N da memória para o registrador t0
    la t0, N        # t0 = endereço de N
    lw t0, 0(t0)    # t0 = valor de N (Nosso limite superior)

    # Inicializa os registradores para o loop
    li a0, 0        # a0 = 0 (Registrador da soma, nossa SAÍDA final)
    li t1, 2        # t1 = 2 (Nosso contador 'i', começando do primeiro par)

# --- Loop Principal ---
# O loop continuará enquanto t1 (i) <= t0 (N)
loop:
    # Condição de saída: if (i > N), salta para o fim.
    # bgt (Branch if Greater Than) é um pseudo-instrução para "blt t0, t1, end"
    bgt t1, t0, end_loop

    # Corpo do loop:
    # Adiciona o número par atual (t1) à soma (a0)
    add a0, a0, t1  # soma = soma + i

    # Incrementa o contador para o próximo número par
    addi t1, t1, 2  # i = i + 2

    # Volta para o início do loop
    j loop

# --- Fim do Programa ---
end_loop:
    # O resultado já está em a0, conforme solicitado pelo enunciado.
    # Agora, encerramos a execução do programa.
    # (Padrão para simuladores como RARS)
    li a7, 10       # Código da chamada de sistema para "exit"
    ecall           # Encerra o programa