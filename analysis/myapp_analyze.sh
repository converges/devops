#!/bin/bash

# 분석 방법이 고도화될 경우 이 스크립트를 분리하여 관리하는 것이 좋습니다.

# 파일 초기화
> analysis/all_results.txt

# 복잡성(Complexity) 분석
cloc src/myapp.c --by-file --csv --quiet --out=reports/myapp_report.txt

echo "------------------------------------" >> reports/myapp_report.txt

# 코딩 표준 준수(Coding Standard) 분석
cppcheck src/myapp.c --output-file=reports/myapp_report.txt

echo "------------------------------------" >> reports/myapp_report.txt

# 메트릭스(Metrics) 분석
radon cc -s src/myapp.c >> reports/myapp_report.txt

echo "------------------------------------" >> reports/myapp_report.txt

# 인증(Certification) 분석
clang-tidy src/myapp.c -checks=cert-* -- >> reports/myapp_report.txt

echo "------------------------------------" >> reports/myapp_report.txt
# MISRA 규칙 분석
misra-c src/myapp.c --output-file=reports/myapp_report.txt

echo "------------------------------------" >> reports/myapp_report.txt
