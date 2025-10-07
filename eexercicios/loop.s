.global teste
.text

teste:
  li a0,0
  li a1,10

loop:
  beq a0,a1,end
  addi a0,a0,1
  j loop

end:
  ret
