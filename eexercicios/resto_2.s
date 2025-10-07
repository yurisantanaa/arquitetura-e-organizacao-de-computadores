.data
.text
.global start
start:
li a0, 10
li a2, 2
li a5, 0 #contador

loop:
    beq a0, zero, end
    rem t1, a0, a2   # t1 = a0 % 2
    beq t1, zero, par
    addi a0, a0, -1
    jal x0, loop
    
    par:
      addi a5, a5, 1
      addi a0, a0, -1
      jal x0, loop 
    
    
    end:
        mv a0, a5
    ret
    

    
    
    