#!/bin/bash

REPORT_FILE_PATH="../reports/myapp_testing.txt"

echo "------------------------------------" >> $REPORT_FILE_PATH
echo "Running System Tests..." >> $REPORT_FILE_PATH

../src/myapp

if [ $? -eq 0 ]
then
  echo "myapp runs successfully." >> $REPORT_FILE_PATH
else
  echo "myapp occurs an error." >> $REPORT_FILE_PATH
fi

echo "System Tests Completed." >> $REPORT_FILE_PATH
