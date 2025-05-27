#!/bin/bash

# Specify the input file
input_file=$1

# Check if the file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File '$input_file' not found."
  exit 1
fi

total_lines=$(wc -l < "$input_file")
line_num=0
filter=""

while IFS= read -r line; do
  line_num=$((line_num + 1))

  if [ "$line_num" -eq "$total_lines" ]; then
    filter+="^$line\$"
  else
    filter+="^$line\$|"
  fi

done < "$input_file"

ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=. --filter="$filter"
