#!/bin/bash

REPORT_FILE_PATH="reports/unit_tests.html"

# HTML 문서 시작
echo "<html><head><title>Unit Tests Report</title></head><body>" > $REPORT_FILE_PATH
echo "<h1>Unit Tests Report</h1>" >> $REPORT_FILE_PATH
echo "<ul>" >> $REPORT_FILE_PATH

# add 함수 테스트
test_add() {
    expected=$1
    result=$(../src/myapp add $2 $3)
    if [ "$result" -eq "$expected" ]; then
        echo "<li>add($2, $3) = $expected: <strong>PASSED</strong></li>" >> $REPORT_FILE_PATH
    else
        echo "<li>add($2, $3) = $expected: <strong>FAILED</strong> (Got $result)</li>" >> $REPORT_FILE_PATH
    fi
}

# sub 함수 테스트
test_sub() {
    expected=$1
    result=$(../src/myapp sub $2 $3)
    if [ "$result" -eq "$expected" ]; then
        echo "<li>sub($2, $3) = $expected: <strong>PASSED</strong></li>" >> $REPORT_FILE_PATH
    else
        echo "<li>sub($2, $3) = $expected: <strong>FAILED</strong> (Got $result)</li>" >> $REPORT_FILE_PATH
    fi
}

# 테스트 케이스 실행
test_add 5 2 3
test_add -6 -5 -1
test_sub -1 2 3
test_sub 4 6 2

echo "</ul>" >> $REPORT_FILE_PATH
echo "</body></html>" >> $REPORT_FILE_PATH