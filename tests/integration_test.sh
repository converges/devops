#!/bin/bash

REPORT_FILE_PATH="reports/integration_tests.html"

echo "<html><head><title>Integration Tests Report</title></head><body>" > $REPORT_FILE_PATH
echo "<h1>Integration Tests Report</h1>" >> $REPORT_FILE_PATH
echo "<ul>" >> $REPORT_FILE_PATH

# 테스트 케이스: add 함수와 sub 함수의 종속성 테스트
declare -a sub_depends_on_add_tests=(
  "2 3"
  "-5 3"
  "-5 -100"
  "111 -1"
)

for i in "${sub_depends_on_add_tests[@]}"; do
  read -r -a params <<< "$i"
  add_result=$(echo "${params[0]} -${params[1]}" | ../src/myapp add)
  sub_result=$(echo "$add_result ${params[1]}" | ../src/myapp sub)

  if [ "$add_result" == "$sub_result" ]; then
    echo "<li>Success: Sub Depends on Add Test $add_result == $sub_result</li>" >> $REPORT_FILE_PATH
  else
    echo "<li>Test Error: $add_result != $sub_result</li>" >> $REPORT_FILE_PATH
  fi
done

echo "</ul>" >> $REPORT_FILE_PATH
echo "</body></html>" >> $REPORT_FILE_PATH
