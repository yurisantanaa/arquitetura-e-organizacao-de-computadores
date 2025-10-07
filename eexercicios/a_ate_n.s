.data
.text
.global soma
soma:
    li a0, 5
    li a1, 0
    loop:
        beq a0, zero, end
        add a1, a1, a0
        addi a0, a0, -1
        j loop
        
    end:
        ret         
        
        

    