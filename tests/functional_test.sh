#!/bin/bash

REPORT_FILE_PATH="./reports/myapp_testing.txt"

echo "------------------------------------" >> $REPORT_FILE_PATH

# 테스트 케이스: add 함수
declare -a add_tests=(
  "2 3 5"
  "-5 -1 -6"
)

# 테스트: add 함수
for i in "${add_tests[@]}"; do
  read -r -a params <<< "$i"
  result=$(echo "${params[0]} ${params[1]}" | ./myapp add)
  expected="${params[2]}"

  if [ "$result" == "$expected" ]; then
    echo "Add Test Passed: ${params[0]} + ${params[1]} = $expected" >> $REPORT_FILE_PATH
  else
    echo "Add Test Failed: Expected $expected, got $result" >> $REPORT_FILE_PATH
  fi
done

# 테스트 케이스: sub 함수
declare -a sub_tests=(
  "5 3 2"
  "-5 -1 -4"
)

# 테스트: sub 함수
for i in "${sub_tests[@]}"; do
  read -r -a params <<< "$i"
  result=$(echo "${params[0]} ${params[1]}" | ./myapp sub)
  expected="${params[2]}"

  if [ "$result" == "$expected" ]; then
    echo "Sub Test Passed: ${params[0]} - ${params[1]} = $expected" >> $REPORT_FILE_PATH
  else
    echo "Sub Test Failed: Expected $expected, got $result" >> $REPORT_FILE_PATH
  fi
done
