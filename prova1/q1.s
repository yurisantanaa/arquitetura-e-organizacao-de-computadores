
.text
.globl f

# a0 = ponteiro para o primeiro elemento do array (argumento 'a')
# a1 = valor inicial da soma (argumento 'b')
f:
loop:
    # Carrega (4 bytes) do endereço de memória em 'a0' para 't0'.
    # Em C: t0 = *a;
    lw t0, 0(a0)

    # pule para end.
    # If (*a == 0) 
    beq t0, x0, end

    # b += *a
    add a1, a1, t0

    # próximo inteiro no array (já que um int ocupa 4 bytes).
    # Em C: a++;
    addi a0, a0, 4

    
    # loop
    jal x0, loop

end:
    # return b;
    addi a0, a1, 0
    jalr x0, 0(ra)