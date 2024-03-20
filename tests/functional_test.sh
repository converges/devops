#!/bin/bash

REPORT_FILE_PATH="reports/functional_tests.html"

echo "<html><head><title>Functional Test Report</title></head><body>" > $REPORT_FILE_PATH
echo "<h1>Functional Test Report</h1>" >> $REPORT_FILE_PATH
echo "<ul>" >> $REPORT_FILE_PATH

# 테스트 케이스: add 함수
declare -a add_tests=(
  "2 3 5"
  "-5 -1 -6"
)

for i in "${add_tests[@]}"; do
  read -r -a params <<< "$i"
  result=$(echo "${params[0]} ${params[1]}" | ./myapp add)
  expected="${params[2]}"

  if [ "$result" == "$expected" ]; then
    echo "<li>Add Test Passed: ${params[0]} + ${params[1]} = $expected</li>" >> $REPORT_FILE_PATH
  else
    echo "<li>Add Test Failed: Expected $expected, got $result</li>" >> $REPORT_FILE_PATH
  fi
done

# 테스트 케이스: sub 함수
declare -a sub_tests=(
  "5 3 2"
  "-5 -1 -4"
)

for i in "${sub_tests[@]}"; do
  read -r -a params <<< "$i"
  result=$(echo "${params[0]} ${params[1]}" | ./myapp sub)
  expected="${params[2]}"

  if [ "$result" == "$expected" ]; then
    echo "<li>Sub Test Passed: ${params[0]} - ${params[1]} = $expected</li>" >> $REPORT_FILE_PATH
  else
    echo "<li>Sub Test Failed: Expected $expected, got $result</li>" >> $REPORT_FILE_PATH
  fi
done

echo "</ul>" >> $REPORT_FILE_PATH
echo "</body></html>" >> $REPORT_FILE_PATH
