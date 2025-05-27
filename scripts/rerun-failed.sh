rm -f aft_run.txt
num_runs=1
AFT_COMMAND="ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=. --filter=\"$1\""

eval "$AFT_COMMAND >> aft_run.txt"
exit_code=$?

while [ $exit_code -ne 0 ]; do
    num_runs=$((num_runs + 1))
    eval "$AFT_COMMAND >> aft_run.txt"
    exit_code=$?
done

echo "Num runs for AFT [$1] -> $num_runs"

