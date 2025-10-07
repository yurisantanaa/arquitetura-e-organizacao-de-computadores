# string.s
# Implementação em Assembly RISC-V de funções da biblioteca string.h

.section .text
.global my_strlen
.global my_strcpy
.global my_strcmp
.global my_strcat
.global my_strncmp

# -----------------------------------------------------------------------------
# size_t strlen(const char *s)
# Descrição: Calcula o comprimento de uma string (não incluindo o terminador nulo).
# Argumentos:
#   a0: ponteiro para o início da string (*s)
# Retorno:
#   a0: comprimento da string
strlen:
    mv t0, a0           # salva o ponteiro inicial em a0
    mv t1, zero         # contador = 0

strlen_loop:
    lb t2, 0(t0)        # carrega o primeiro caractere em t2
    beq t2, zero, strlen_end # se o byte for nulo ('\0'), termina o loop
    addi t0, t0, 1      # Avança o ponteiro para o próximo caractere
    addi t1, t1, 1      # Incrementa o contador de comprimento
    j strlen_loop       # repete

strlen_end:
    mv a0, t1           # move o resultado (comprimento) para o registrador de retorno a0
    ret                 # retorna
# -----------------------------------------------------------------------------
# char *strcpy(char *dest, const char *src)
# Descrição: Copia a string de src para dest, incluindo o terminador nulo.
# Argumentos:
#   a0: ponteiro para o buffer de destino (*dest)
#   a1: ponteiro para a string de origem (*src)
# Retorno:
#   a0: ponteiro original para dest
strcpy:
    mv t0, a0           # salva o ponteiro em t0 para retorno

strcpy_loop:
    lb t1, 0(a1)        # carrega um caractere de src em t1
    sb t1, 0(a0)        # armazena o caractere de t1 em a0
    addi a0, a0, 1      # avança o ponteiro de destino
    addi a1, a1, 1      # avança o ponteiro de origem
    bnez t1, strcpy_loop # continua o loop se o byte copiado não for nulo

strcpy_end:
    mv a0, t0           # restaura o ponteiro original de dest para o retorno
    ret                 # retorna

# -----------------------------------------------------------------------------
# int strcmp(const char *s1, const char *s2)
# Descrição: Compara duas strings.
# Argumentos:
#   a0: ponteiro para a primeira string (*s1)
#   a1: ponteiro para a segunda string (*s2)
# Retorno:
#   a0:
#     - < 0 se s1 < s2
#     -   0 se s1 == s2
#     - > 0 se s1 > s2
strcmp:
strcmp_loop:
    lbu t0, 0(a0)       # carrega byte de s1 (unsigned) // unsigned para valores de char > 127
    lbu t1, 0(a1)       # carrega byte de s2 (unsigned)

    # caso para strings iguais
    beq t0, zero, strcmp_s1_end

    # se os caracteres são diferentes, a comparação termina
    bne t0, t1, strcmp_diff

    # se iguais e não nulos, continua
    addi a0, a0, 1      # avança s1
    addi a1, a1, 1      # avança s2
    j strcmp_loop

strcmp_s1_end:
    # se s1 terminou (t0=0), o resultado é 0 se s2 também terminou, senão -1.
    sub a0, t0, t1      # 0 - t1. Será 0 se t1=0, ou negativo se t1>0.
    ret

strcmp_diff:
    # os caracteres são diferentes. o resultado é a diferença entre eles.
    sub a0, t0, t1
    ret

# -----------------------------------------------------------------------------
# char *strcat(char *dest, const char *src)
# Descrição: Anexa a string src ao final da string dest.
# Argumentos:
#   a0: ponteiro para a string de destino (*dest)
#   a1: ponteiro para a string de origem (*src)
# Retorno:
#   a0: ponteiro original para dest
strcat:
    mv t0, a0           # salva o ponteiro original de dest para o retorno

# percorre a primeira string ate achar o fiinal
strcat_find_end:
    lb t1, 0(a0)        # Carrega um byte de dest
    beq t1, zero, strcat_copy # Se encontrou o terminador nulo, começa a cópia
    addi a0, a0, 1      # Avança o ponteiro dest
    j strcat_find_end

# agora, copia src para o final de dest
strcat_copy:
    lb t1, 0(a1)        # carrega um byte de src
    sb t1, 0(a0)        # armazena em dest
    addi a0, a0, 1      # avança dest
    addi a1, a1, 1      # avança src
    bnez t1, strcat_copy # continua se o byte não for nulo

strcat_end:
    mv a0, t0           # restaura o ponteiro original de dest para o retorno
    ret

# -----------------------------------------------------------------------------
# char *strncpy(char *dest, const char *src, size_t n)
# Descrição: Copia até 'n' caracteres de src para dest.
#            Se src for menor que 'n', preenche o restante de dest com nulos.
#            Se src for maior ou igual a 'n', dest não será terminado por nulo!
# Argumentos:
#   a0: ponteiro para o buffer de destino (*dest)
#   a1: ponteiro para a string de origem (*src)
#   a2: número máximo de bytes a copiar (n)
# Retorno:
#   a0: ponteiro original para dest
strncpy:
    mv t0, a0           # salva o ponteiro original de dest
    mv t1, zero         # indica se o terminador nulo de src foi encontrado como se fosse um bool

strncpy_loop:
    # verifica se o contador n chegou a zero
    beq a2, zero, strncpy_end

    # se o nulo de src já foi encontrado, apenas preenche com nulos
    bnez t1, strncpy_fill_null

    # carrega byte de src
    lb t2, 0(a1)
    # armazena em dest
    sb t2, 0(a0)

    # se o byte carregado for nulo, ativa a flag
    beq t2, zero, strncpy_set_null_flag

    # avança ponteiros
    addi a1, a1, 1
    j strncpy_next_iter

strncpy_set_null_flag:
    li t1, 1            # seta t1 = 1
    j strncpy_next_iter

strncpy_fill_null:
    sb zero, 0(a0)      # preenche com nulo

strncpy_next_iter:
    addi a0, a0, 1      # avança dest
    addi a2, a2, -1     # decrementa n
    j strncpy_loop

strncpy_end:
    mv a0, t0           # restaura o ponteiro original para o retorno
    ret

