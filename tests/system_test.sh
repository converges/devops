#!/bin/bash

REPORT_FILE_PATH="reports/system_tests.html"

echo "<html><head><title>System Tests Report</title></head><body>" > $REPORT_FILE_PATH
echo "<h1>System Tests Report</h1>" >> $REPORT_FILE_PATH
echo "<ul>" >> $REPORT_FILE_PATH

../src/myapp

if [ $? -eq 0 ]; then
  echo "<li>myapp runs successfully.</li>" >> $REPORT_FILE_PATH
else
  echo "<li>myapp occurs an error.</li>" >> $REPORT_FILE_PATH
fi

echo "</ul>" >> $REPORT_FILE_PATH
echo "</body></html>" >> $REPORT_FILE_PATH
