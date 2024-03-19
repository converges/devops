#include "myapp.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc < 4) {
        printf("Usage: %s add|sub num1 num2\n", argv[0]);
        return 1;
    }

    int result = 0;
    int num1 = atoi(argv[2]);
    int num2 = atoi(argv[3]);

    if (strcmp(argv[1], "add") == 0) {
        result = add(num1, num2);
    } else if (strcmp(argv[1], "sub") == 0) {
        result = sub(num1, num2);
    } else {
        printf("Invalid operation\n");
        return 1;
    }

    printf("%d\n", result);
    return 0;
}