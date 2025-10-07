/* .text                   
.globl 

_start  

addi t0, x0, 4
addi t1, x0, 0

loop:
    add t1, t1, t0
    addi t0, t0, -1
    bnez t0, loop
    addi a0, t1, 0
    ret

*/

#include <stdio.h>

/*int main() {
    int sum = 0;
    for (int i = 4; i > 0; i--) {
        sum += i;
    }
    printf("Sum: %d\n", sum);
    return 0;
}

*/

int g() {

    int t0 = 4;
    int t1 = 0;

    while(t0 != 0) {
        t1 += t0;
        t0--;
    }   
    return t1;

}