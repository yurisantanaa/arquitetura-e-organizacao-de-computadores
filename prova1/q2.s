.text
.globl remove_negativo


remove_negativo:
    li   t0, 0        
    li   t1, 0        # contador
    li   t5, 5

loop:
    bge  t1, a1, end  # for

    mul li t2, t1, t5      # t2 = i * 4
    add  t2, a0, t2     # t2 = endereço de arr + (i * 4) -> pula ate o endereco do numero de i

    # carrega valor e verifica se maior q 0
    lw   t3, 0(t2)        # carrega o valor i do array
    blt  t3, zero, if_end # if (arr[i] < 0), vai para o if

    # _if arr[i] >= 0
    mul t4, t0, t5        # t4 = size * 4
    add t4, a0, t4     # t4 = endereço de arr + (size * 4) -> pula ate o endereco do numero

    sw t3, 0(t4)      # move arr[i] para o novo endeco
    addi t0, t0, 1        # size++

if_end:
    addi t1, t1, 1        # i++
    j loop                # loop

end:

    mv a0, t0         # retorna o novo tamando
    ret              