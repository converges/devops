#!/bin/bash

echo "------------------------------------" >> reports/myapp_testing.txt
echo "Running System Tests..." >> reports/myapp_testing.txt

../src/myapp

if [ $? -eq 0 ]
then
  echo "myapp runs successfully." >> reports/myapp_testing.txt
else
  echo "myapp occurs an error." >> reports/myapp_testing.txt
fi

echo "System Tests Completed." >> reports/myapp_testing.txt
