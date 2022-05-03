OUT=a.out

bash benchmark.sh &> $OUT

# Print out build and query times for each program file in benchmark.sh
grep "real" $OUT | awk -F 'm' '{print $2}' | awk -F 's' '{print $1}'