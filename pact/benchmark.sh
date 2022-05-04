# Modify remove-contracts.rkt Line 22 to return Defn or expand contract
PROGRAM_DIR=programs/return_value
TRIALS=30

# Select between "s" or "run"
FILE_TYPE=s

files=($( ls $PROGRAM_DIR/*.rkt ))

rm ${PROGRAM_DIR}/*.run
rm ${PROGRAM_DIR}/*.prof
rm nohup.out
rm

for file in "${files[@]}"
do
  cleaned_file_path="${file%.rkt}"
  executable=${cleaned_file_path}.${FILE_TYPE}
  cleaned_file="${cleaned_file_path#${PROGRAM_DIR}/}"

  echo "Profiling compile time for" $cleaned_file_path
  time make $executable
    
  echo "Compiled code size:" $(wc -c ${executable})

  echo "Profiling run time for " $cleaned_file
  time ./${executable}
done