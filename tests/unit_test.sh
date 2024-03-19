#!/bin/bash

REPORT_FILE_PATH="reports/myapp_testing.txt"

echo "------------------------------------" > $REPORT_FILE_PATH
echo "Running Unit Tests..." >> $REPORT_FILE_PATH

# add 함수 테스트
test_add() {
    expected=$1
    result=$(../src/myapp add $2 $3)
    if [ "$result" -eq "$expected" ]; then
        echo "add($2, $3) = $expected: PASSED" >> $REPORT_FILE_PATH
    else
        echo "add($2, $3) = $expected: FAILED (Got $result)" >> $REPORT_FILE_PATH
    fi
}

# sub 함수 테스트
test_sub() {
    expected=$1
    result=$(../src/myapp sub $2 $3)
    if [ "$result" -eq "$expected" ]; then
        echo "sub($2, $3) = $expected: PASSED" >> $REPORT_FILE_PATH
    else
        echo "sub($2, $3) = $expected: FAILED (Got $result)" >> $REPORT_FILE_PATH
    fi
}

# 테스트 케이스 실행
test_add 5 2 3
test_add -6 -5 -1
test_sub -1 2 3
test_sub 4 6 2

echo "Unit Tests Completed." >> $REPORT_FILE_PATH
