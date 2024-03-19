#include <stdio.h>
#include <assert.h>

// 파일 경로
#define REPORT_FILE_PATH "reports/myapp_testing.txt"

#include "../src/myapp.c"

void test_add();
void test_sub();
void initialize_testing_file();

int main() {
    initialize_testing_file(); // report 파일 초기화

    test_add();
    test_sub();

    return 0;
}

// report 파일 초기화 함수
void initialize_testing_file() {
    FILE *fp;
    fp = fopen(REPORT_FILE_PATH, "w");
    assert(fp != NULL);
    fprintf(fp, "------------------------------------\n");
    fprintf(fp, "Running Unit Tests...\n");
    fclose(fp);
}

// add 함수 테스트 함수
void test_add() {
    FILE *fp;
    fp = fopen(REPORT_FILE_PATH, "a");
    assert(fp != NULL);


    assert(add(2, 3) == 5);
    assert(add(19, -1) == 18);
    assert(add(-3, -2) == -5);
    fprintf(fp, "test: add passed\n");

    fclose(fp);
}

// sub 함수 테스트 함수
void test_sub() {
    FILE *fp;
    fp = fopen(REPORT_FILE_PATH, "a");
    assert(fp != NULL);

    assert(sub(2, 3) == -1);
    assert(sub(19, -1) == 20);
    assert(sub(-3, -2) == -1);
    fprintf(fp, "test: sub passed\n");

    fclose(fp);
}
