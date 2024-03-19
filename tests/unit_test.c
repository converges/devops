#include "../src/myapp.c"
#include <assert.h>

void test_add();
void test_sub();

int main() {
    test_add();
    test_sub();

    return 0;
}

void test_add() {
    assert(add(2, 3) == 5);
    assert(add(19, -1) == 18);
    assert(add(-3, -2) == -5);
    printf("test: add passed\n");
}

void test_sub() {
    assert(sub(2, 3) == -1);
    assert(sub(19, -1) == 20);
    assert(sub(-3, -2) == -1);
    printf("test: sub passed\n");
}
