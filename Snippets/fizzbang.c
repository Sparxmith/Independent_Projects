#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char const *argv[]) {
  int x;

  for(x=1; x <= 100; x++)
    if (x % 15 == 0){ // Switch/Case?       
      printf("FizzBuzz\n");
    } else if (x % 3 == 0) {
      printf("Fizz\n");
    } else if (x % 5 == 0) {
      printf("Buzz\n");
    } else {
      printf("%d\n", x);
    }
  return 0;
}
