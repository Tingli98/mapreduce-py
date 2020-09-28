#!/usr/bin/env bash
#----------------------------------------------------------
# This script runs the MR program for flights by carriers
# It then scan the result in /tmp folder.
# It then replace 'tab' \t with spaces (' ') so that it
# can perform a match with input #3.
#----------------------------------------------------------
echo './fbc_run.sh input-path output-path'
hdfs dfs -rm -r $2
yarn jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming*.jar \
  -mapper app/FlightsByDestMapper.py \
  -reducer app/FlightsByDestReducer.py -input $1 -output $2

value=$(hdfs dfs -cat $2/part-00000)
value=$(echo $value | sed -r 's/\t/ /g')
echo $value

if [[ $value == *"$3"* ]]; then
  echo "FlightsByDest runs successfully ($1)!"
else
  echo "FlightsByDest runs UNsuccessfully ($1)"
  echo "Search: '$3'"
  echo "Actual:"; echo "$value"
fi


