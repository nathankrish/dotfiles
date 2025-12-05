#!/bin/bash

report="---------- AFT Report ----------\n"
function print_report {
	echo -e $report
	echo -e $report >> aft_report.txt
}
trap print_report EXIT
rm -f aft_report.txt
# Specify the input file
if [ $# -eq 0 ]
	then
		input_file="functest/data/testcase/failed.testcase.txt"
		rm -f failed_afts.txt 
		cp $input_file failed_afts.txt
	else
		input_file=$1
fi

# Check if the file exists
if [ ! -f "$input_file" ]; then
	echo "Error: File '$input_file' not found."
	exit 1
fi

failing_afts=$(< $input_file)
while IFS= read -r line; do
	# use -a to add one to the number of runs (if already run AFTs once)
	if [[ $* == *-a* ]]
		then
			num_runs=1
		else
			num_runs=2
	fi
	AFT_COMMAND="ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=. --filter='^$line\$'"

	eval $AFT_COMMAND
	exit_code=$?

	while [ $exit_code -ne 0 ]; do
	    num_runs=$((num_runs + 1))
	    eval $AFT_COMMAND
	    exit_code=$?
	done

	report+="[  $num_runs runs    ] $line\n"

done <<< "$failing_afts"

print_report()
