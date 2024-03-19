#!/bin/bash

echo "------------------------------------" >> reports/myapp_testing.txt

echo "Running Integration Tests..."

# 테스트 케이스: add 함수와 sub 함수의 종속성 테스트
declare -a sub_depends_on_add_tests=(
  "2 3"
  "-5 3"
  "-5 -100"
  "111 -1"
)

for i in "${sub_depends_on_add_tests[@]}"; do
  read -r -a params <<< "$i"
  add_result=$(echo "${params[0]} -${params[1]}" | ../src/myapp add) # add 두 번째 인자 음수로
  sub_result=$(echo "$add_result ${params[1]}" | ../src/myapp sub)

  if [ "$add_result" == "$sub_result" ]; then
    echo "Success: Sub Depends on Add Test $add_result == $sub_result" >> reports/myapp_testing.txt
  else
    echo "Test Error: $add_result == $sub_result" >> reports/myapp_testing.txt
  fi
done

echo "Integration Tests Completed."