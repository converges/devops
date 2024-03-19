#!/bin/bash
#include <stdio.h>

int add(int a, int b);
int mul(int a, int b);


int main() {
    printf("Hello, World!\n");

    int sum = add(3, 4);

    
    return 0;
}

int add(int a, int b) {
    return a + b;
}

int sub(int a, int b) { // depends on the add function
    return add(a, -b);
}
