#include <stddef.h>
#include <stdio.h>

int remove_negatives(int *arr, size_t size)
{
  size_t new_size = 0;
  for (int i = 0; i < size; i++)
  {
    if (arr[i] >= 0)
    {
      arr[new_size] = arr[i];
      new_size++;
    }
  }
  return new_size;
}

int main(){
  int a[] = {1,2,3,4,5,-6,-7,8,0};
  printf("%d", remove_negatives(a,9));
}