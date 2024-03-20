#!/bin/bash

REPORT_FILE_PATH="reports/performance_tests.html"

echo "<html><head><title>Performance Test Report</title></head><body>" > $REPORT_FILE_PATH
echo "<h1>Performance Test Report</h1>" >> $REPORT_FILE_PATH

# 테스트 기준 시간: 10초
threshold=10

# Timer starts
start_time=$(date +%s%N)

../src/myapp

# Timer ends
end_time=$(date +%s%N)

# 단위: ns -> s
response_time=$((end_time - start_time))
response_time_seconds=$(echo "scale=9; $response_time/1000000000" | bc)

if (( $(echo "$response_time_seconds > $threshold" | bc -l) ))
then
  echo "<p><strong>Exceed Time Error!</strong> 실행 시간(초): $response_time_seconds, 기준 시간(초): $threshold.</p>" >> $REPORT_FILE_PATH
else
  echo "<p><strong>Success:</strong> 실행 시간(초): $response_time_seconds, 기준 시간(초): $threshold.</p>" >> $REPORT_FILE_PATH
fi

echo "<p>Response time: $response_time_seconds seconds</p>" >> $REPORT_FILE_PATH

echo "</body></html>" >> $REPORT_FILE_PATH