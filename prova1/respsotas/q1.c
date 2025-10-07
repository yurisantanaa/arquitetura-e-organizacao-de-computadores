#include<stdio.h>

//intera o array por meio do ponteiro iterando 4 a variavel b, se encontrar 0 no array, retorna b.

int f(int *a, int b) {
    while (*a != 0) {
        b += *a;
        a++;
    }
    return b;
}

int main(){
  int b = 0;
  int a[] = {1,2,3,4,5,6,7,8,0};
  printf("%d",f(a,b));
}