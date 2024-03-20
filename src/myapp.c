#include <stdio.h>
#include <stdlib.h>

int add(int, int);
int sub(int, int);

int main(void) {

    int num1 = 10, num2 = 20;
    int add_result, sub_result;

    add_result = add(num1, num2);
    sub_result = sub(num1, num2);

    printf("Sum: %d\n", add_result);
    printf("Diff: %d\n", sub_result);
    
    return 0;
}


int add(int a, int b) {
    return a + b;
}

int sub(int a, int b) {
    return add(a, -b);
}