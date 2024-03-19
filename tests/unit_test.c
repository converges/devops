#include <stdio.h>
#include <stdlib.h>

#define REPORT_FILE_PATH "reports/myapp_testing.txt"
#include "../src/myapp.h"

void test_add();
void test_sub();
void initialize_testing_file();
void log_test_result(FILE *fp, int condition, char *testName);

int main() {
    initialize_testing_file(); // report 파일 초기화

    test_add();
    test_sub();

    return 0;
}

void initialize_testing_file() {
    FILE *fp = fopen(REPORT_FILE_PATH, "w");
    if (fp == NULL) {
        perror("Error opening file");
        exit(1);
    }
    fprintf(fp, "------------------------------------\n");
    fprintf(fp, "Running Unit Tests...\n");
    fclose(fp);
}

void test_add() {
    FILE *fp = fopen(REPORT_FILE_PATH, "a");
    if (fp == NULL) {
        perror("Error opening file");
        exit(1);
    }

    log_test_result(fp, add(2, 3) == 5, "add(2, 3) == 5");
    log_test_result(fp, add(19, -1) == 18, "add(19, -1) == 18");
    log_test_result(fp, add(-3, -2) == -5, "add(-3, -2) == -5");

    fclose(fp);
}

void test_sub() {
    FILE *fp = fopen(REPORT_FILE_PATH, "a");
    if (fp == NULL) {
        perror("Error opening file");
        exit(1);
    }

    log_test_result(fp, sub(2, 3) == -1, "sub(2, 3) == -1");
    log_test_result(fp, sub(19, -1) == 20, "sub(19, -1) == 20");
    log_test_result(fp, sub(-3, -2) == -1, "sub(-3, -2) == -1");

    fclose(fp);
}

void log_test_result(FILE *fp, int condition, char *testName) {
    if (condition) {
        fprintf(fp, "Test Passed: %s\n", testName);
    } else {
        fprintf(fp, "Test FAILED: %s\n", testName);
    }
}
