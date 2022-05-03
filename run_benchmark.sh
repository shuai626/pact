OUT=a.out

bash benchmark.sh &> $OUT

# Print out build and query times for each program file in benchmark.sh
grep "real" $OUT | awk -F 'm' '{print $2}' | awk -F 's' '{print $1}'

# Print out compile code size (in bytes) for each program file in benchmark.sh
# Can specify file size of .run executable or .s assembly script
grep "Compiled code size" $OUT | awk -F ': ' '{print $2}' | awk -F ' ' '{print $1}'