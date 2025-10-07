.data
N: .word 158 

.text
.globl main

main:
    lw $a0, N        # Load the value of N into argument register $a0
    jal sum_to_n     # Call the sum_to_n function

    # After the function returns, the result is in $v0.
    # The prompt requests the final result in $a0.
    move $a0, $v0

    # Exit the program
    li $v0, 10
    syscall

# int sum_to_n(int n)
#  - n: input integer in $a0
#  - returns: sum of 1 to n in $v0
sum_to_n:
    # Base case: if (n == 0) return 0
    beq $a0, $zero, return_zero

    # Recursive step
    # Save the return address and the current value of n on the stack
    addiu $sp, $sp, -8   # Allocate space on the stack for two words
    sw $ra, 4($sp)       # Save the return address
    sw $a0, 0($sp)       # Save the current value of n

    # Prepare for the recursive call: sum_to_n(n - 1)
    addiu $a0, $a0, -1   # n = n - 1
    jal sum_to_n         # Recursive call

    # Restore the original value of n and the return address from the stack
    lw $a0, 0($sp)       # Restore n
    lw $ra, 4($sp)       # Restore the return address
    addiu $sp, $sp, 8    # Deallocate stack space

    # Complete the operation: return n + sum_to_n(n - 1)
    # The result of sum_to_n(n-1) is in $v0
    add $v0, $a0, $v0    # result = n + sum_to_n(n - 1)

    # Return to the caller
    jr $ra

return_zero:
    # Base case: return 0
    li $v0, 0
    jr $ra