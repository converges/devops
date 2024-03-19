#!/bin/bash

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

# Check if the response time exceeds the threshold
if (( $(echo "$response_time_seconds > $threshold" | bc -l) ))
then
  echo "Exceed Time Error! 실행 시간(초): $response_time_seconds, 기준 시간(초)):$threshold."
else
  echo "Success: 실행 시간(초): $response_time_seconds, 기준 시간(초)):$threshold."
fi

echo "Response time: $response_time_seconds seconds"