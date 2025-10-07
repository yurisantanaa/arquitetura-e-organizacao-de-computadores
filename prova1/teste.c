#include <stdio.h>
#include <stddef.h>

extern remove_negativo(int *arr, size_t size);

int main(){
  int a[] = {1,2,3,4,5,-6,-7,8,0};
  printf("%d", remove_negatives(a,9));
}