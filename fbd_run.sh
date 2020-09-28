#!/usr/bin/env bash
#----------------------------------------------------------
# This script runs the MR program for flights by destination
# It then scan the result in /tmp folder.
# It then replace 'tab' \t with spaces (' ') so that it
# can perform a match with input #3.
#----------------------------------------------------------
echo './fbd_run.sh input-path output-path'
hdfs dfs -rm -r $2
yarn jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming*.jar \
  -mapper app/FlightsByDestMapper.py \
  -reducer app/FlightsByDestReducer.py -file app/FlightsByDestMapper.py -file app/FlightsByDestReducer.py -input $1 -output $2

value=$(hdfs dfs -cat $2/part-00000)
value=$(echo $value | sed -r 's/\t/ /g')
echo $value

if [[ $value == *"$3"* ]]; then
  echo "FlightsByDestination runs successfully ($1)!"
else
  echo "FlightsByDestination runs UNsuccessfully ($1)"
  echo "Search: '$3'"
  echo "Actual:"; echo "$value"
fi

# 2003 result (partial):
#ABE 4069 ABI 2525 ABQ 36705 ABY 1450 ACK 193 ACT 2731 ACV 3997 ACY 132 ADK 74 ADQ 726 AEX 3263 AGS 4323 AKN 347 ALB 17087 AMA 8362 ANC 21022 ATL 368659 ATW 1087 AUS 41011 AVL 3683 AVP 863 AZO 3202 BDL 33560 BET 1175 BFF 1 BFL 2756

