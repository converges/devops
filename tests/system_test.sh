#!/bin/bash
echo "Running System Tests..."

../src/myapp

if [ $? -eq 0 ]
then
  echo "myapp runs successfully."
else
  echo "myapp occurs an error."
fi

echo "System Tests Completed."