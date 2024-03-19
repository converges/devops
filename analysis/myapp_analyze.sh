#!/bin/bash

REPORT_FILE_PATH="reports/myapp_analysis.txt"

# 파일 초기화
> $REPORT_FILE_PATH

# 복잡성(Complexity) 분석
cloc src/myapp.c --by-file --csv --quiet --out=$REPORT_FILE_PATH

echo "------------------------------------" >> $REPORT_FILE_PATH

# 코딩 표준 준수(Coding Standard) 분석
cppcheck src/myapp.c --output-file=$REPORT_FILE_PATH

echo "------------------------------------" >> $REPORT_FILE_PATH

# 메트릭스(Metrics) 분석
radon cc -s src/myapp.c >> $REPORT_FILE_PATH

echo "------------------------------------" >> $REPORT_FILE_PATH

# 인증(Certification) 분석
clang-tidy src/myapp.c -checks=cert-* -- >> $REPORT_FILE_PATH

echo "------------------------------------" >> $REPORT_FILE_PATH

# MISRA 규칙 분석
misra-c src/myapp.c --output-file=$REPORT_FILE_PATH

echo "------------------------------------" >> $REPORT_FILE_PATH
