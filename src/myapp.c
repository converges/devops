#include "myapp.h"
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int sub(int a, int b) {
    return add(a, -b);
}

int main() {
    printf("Hello, World!\n");
    int sum = add(3, 4);
    return 0;
}
