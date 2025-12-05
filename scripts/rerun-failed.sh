rm -f aft_run.txt
num_runs=1
AFT_COMMAND="ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=. --filter=\"$1\""

eval "$AFT_COMMAND"
exit_code=$?

while [ $exit_code -eq 0 ]; do
    num_runs=$((num_runs + 1))
    eval "$AFT_COMMAND"
    exit_code=$?
done

echo "Num runs for AFT [$1] -> $num_runs"

