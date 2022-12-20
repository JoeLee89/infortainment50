#!/bin/bash
source ./common_func.sh
times=0

loop_time=$(date +%s --date="+12 hour")
file_name="all_tests_auto_EBOARD_ADi_$board.sh"
#file_name="test.txt"
#sed -i 's/"/\\"/g' $file_name

#set start time will make the program pause, until the setting time reach
#input start time format ex. "10/26/21-11" to start setting wait time, or set to 0 to skip the function
#start_time="10/26/21-11"
start_time=0

#to set others=1 will set the other() function launch, if your project support the script
#or just set to =0 to skip the test
others_script=1

other() {
#  print_command "sudo ./idll-test"$executable" -- --EBOARD_TYPE EBOARD_ADi_"$board" "Scenario: adiWatchdogSetSystemRestart" -s"

  other_00=$(./idll-test"$executable" -- --EBOARD_TYPE EBOARD_ADi_"$board" "Scenario: adiWatchdogSetSystemRestart")
  other_00_cmd="./idll-test"$executable" -- --EBOARD_TYPE EBOARD_ADi_"$board" \"Scenario: adiWatchdogSetSystemRestart\""
  other_01=$(./idll-test"$executable" -- --EBOARD_TYPE EBOARD_ADi_"$board" "Scenario: adiBatSetLowVoltage")
  other_01_cmd="./idll-test"$executable" -- --EBOARD_TYPE EBOARD_ADi_"$board" \"Scenario: adiBatSetLowVoltage\""
  other_02=$(./idll-test"$executable" --BAT-QTY 3 -- --EBOARD_TYPE EBOARD_ADi_"$board" "Scenario: adiBatSetWarningVoltage")
  other_02_cmd="./idll-test"$executable" --BAT-QTY 3 -- --EBOARD_TYPE EBOARD_ADi_"$board" \"Scenario: adiBatSetWarningVoltage\""

  for i in $(seq 0 2); do
    case $i in
    0)
      other=$other_00
      other_cmd=$other_00_cmd

      ;;
    1)
      other=$other_01
      other_cmd=$other_01_cmd

      ;;
    2)
      other=$other_02
      other_cmd=$other_02_cmd

      ;;
    esac

    print_command "$other_cmd"
    echo "$other"
    echo "================================================================================================" >> result.log
    echo "$other_cmd" >> result.log
    echo "================================================================================================" >> result.log
    compare_result "$other" "passed"
    echo "$other" >> result.log
  done
}

wait_times() {
  while true; do
    date=$(date '+%D-%k')
    if [[ "$date" =~ $start_time ]]; then
      break
    fi
    sleep 5
    echo $date
    echo 'wait...'

  done
}

#====================================================
if [[ "$start_time" -ne 0 ]]; then
  wait_times
fi

while true; do
  ((times++))
  echo "<<Times=$times>>" >> result.log
  echo "$(date +%D-%T)" >>result.log

  if [[ "$others_script" -ne 0 ]]; then
    other
  fi

  while read line; do
    con=$(echo "$line" | grep -i "idll-test" | grep -v "#\|\"" | sed "s/\r//g")

    if [[ "${#con}" -ne 0 ]]; then
      for (( i = 1; i < $(shuf -i 3-6 -n 1); i++ )); do

          echo "$(date +%D-%T)" >> result.log
          launch_command "$con"
          echo "================================================================================================" >> result.log
          echo "$con" >> result.log
          echo "================================================================================================" >> result.log
          compare_result "$result" "passed"
          echo "$result" >> result.log
      done
    fi
  done < $file_name

  if [ "$(date +%s)" -gt "$loop_time" ]; then
    echo "The setting time's up!!"
    echo "The overall test times= $times"
    break
  fi

done

