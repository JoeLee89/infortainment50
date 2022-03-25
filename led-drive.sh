#!/bin/bash
source ./common_func.sh

#===============================================================
#LED all function
#===============================================================
count_whole_blink_sec(){
  blink_period_=$(($1+1))
#  printf "blink_period_= $blink_period_\n"
  project_period_=$2
  echo "$(echo "scale=2; $blink_period_/$project_period_" | bc)"
}


LED_set_get(){
  title b "To set / get pin and set / get port value for all leds"
  read -p "This test will loop forever, until press CTRL+C..."

  while true; do
    launch_command "sudo ./idll-test"$executable" --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive"
    compare_result "$result" "pass"
  done
}
LedLoop(){
  local period duty pin
  read -p "How many pins does the project support?" pin
  read -p "Press [q] will exit the loop."

  while true; do
    read -rsn 1 -t 0.05 input
    if [[ "$input" == "q" ]]; then
      break
    fi

    for (( i = 0; i < pin; i++ )); do
      period=$(shuf -i 0-10000 -n 1)
      duty=$(shuf -i 0-100 -n 1)
      launch_command "sudo ./idll-test"$executable" --PIN_NUM $i --PERIOD $period --DUTY_CYCLE $duty --BRIGHTNESS 90 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
      verify_result "$result"
    done

  done
}

LED(){
  brightness=40
  duty_cycle=50
  blink_period=1000
  brightness_verify_value=("100" "99" "70" "50" "30" "10" "1" "0")
  duty_cycle_list=("100" "99" "50" "10" "1" "0")
  blink_period_list=("10000" "9999" "7000" "480" "150" "160" "1" "0")
  printcolor w "How many pins does the project support?"
  read -p "" led_amount
  led_amount=${led_amount:-32}
#  if [ "$1" == "scxx" ]; then
#    project_period=24
#    led_amount=23
#  elif [ "$1" == "sa3" ]; then
#    project_period=6
#    led_amount=15
#  fi

#  blink_period_sec=$(count_whole_blink_sec $blink_period $project_period)

#  for all in $(seq 0 $led_amount); do
  for (( all=0; all < led_amount; all++ )); do
    for brightness_ in "${brightness_verify_value[@]}"; do
      printf "\n\n\n"
      printcolor w "LED: $all"
      printcolor r "Setting brightness: $brightness_"
      printcolor w "Blinking period: $blink_period ms"
      printcolor w "Duty cycle: $duty_cycle"
      printcolor w "==============================================="

      if [ "$brightness_" == 0 ]; then
        printcolor r "Note: the LED will STOP blinking/ turned LED OFF, while brightness = 0 "
      elif [ "$brightness_" == 100 ]; then
        printcolor r "Note: the LED will STOP blinking/ turned LED ON, while brightness = 100"
      fi

      read -p "enter to continue above setting..."
      launch_command "sudo ./idll-test"$executable" --PIN_NUM $all --PERIOD $blink_period --DUTY_CYCLE $duty_cycle --BRIGHTNESS $brightness_ -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
      compare_result "$result" "Brightness: $brightness_"
    done


    for dutycycle in "${duty_cycle_list[@]}"; do
      printf "\n\n\n"
      printcolor w "LED: $all"
      printcolor w "Setting brightness: $brightness"
      printcolor w "Blinking period: $blink_period ms"
      printcolor r "Duty cycle: $dutycycle"
      printcolor w "=============================================== "
      printcolor r 'Note: brightness will NOT be changed, while blink/period item testing'

      if [ "$dutycycle" == 0 ]; then
        printcolor r "Note: the LED will stop blinking / turned LED OFF, while duty cycle = 0"
      elif [ "$dutycycle" == 100 ]; then
        printcolor r "Note: the LED will stop blinking / turned LED ON, while duty cycle = 100"
      fi

      read -p "enter to continue above setting..."
      launch_command "sudo ./idll-test"$executable" --PIN_NUM $all --PERIOD $blink_period --DUTY_CYCLE $dutycycle --BRIGHTNESS $brightness -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
      compare_result "$result" "Duty cycle: $dutycycle"
    done


    for blink in "${blink_period_list[@]}"; do

      #blink period setting
      printf "\n\n\n"
      printcolor w "LED: $all"
      printcolor w "Setting brightness: $brightness"
      printcolor r "Blinking period: $blink ms"
      printcolor w "Duty cycle: $duty_cycle"
      printcolor w "==============================================="
      printcolor r 'Note: brightness will NOT be changed, while blink/period item testing'

      if [ "$blink" == 0 ]; then
          printcolor r "Note: the LED will stop blinking/ LED SOLID OFF, while blinking period = 0"
      fi

      read -p "enter to continue above setting..."
      launch_command "sudo ./idll-test"$executable" --PIN_NUM $all --PERIOD $blink --DUTY_CYCLE $duty_cycle --BRIGHTNESS $brightness -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
      compare_result "$result" "nPeriod: $blink"
    done

    #just disable the led not te be tested.
    read -p "enter to reset LED status..."
    sudo ./idll-test"$executable" --PIN_NUM $all --PERIOD 0 --DUTY_CYCLE 0 --BRIGHTNESS 0 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink

  done
}

#===============================================================
#parameter
#===============================================================
parameter(){
  title "Check bad parameter... "
  command_line=(
  "sudo ./idll-test"$executable" --PIN_NUM 25 --PERIOD 23 --DUTY_CYCLE 255 --BRIGHTNESS 255 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
  "sudo ./idll-test"$executable" --PIN_NUM 23 --PERIOD 256 --DUTY_CYCLE 255 --BRIGHTNESS 255 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
  "sudo ./idll-test"$executable" --PIN_NUM 23 --PERIOD 23 --DUTY_CYCLE 256 --BRIGHTNESS 255 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
  "sudo ./idll-test"$executable" --PIN_NUM 23 --PERIOD 23 --DUTY_CYCLE 255 --BRIGHTNESS 256 -- --EBOARD_TYPE EBOARD_ADi_"$board" --section GPO_LED_Drive_SetBlink"
  )

  for command in "${command_line[@]}";do
    launch_command "$command"
    compare_result "$result" "failed" "skip"
  done

}


#===============================================================
#MAIN
#===============================================================

while true; do
  printf  "\n"
  printf  "${COLOR_RED_WD}1. LED VERIFY ${COLOR_REST}\n"
  printf  "${COLOR_RED_WD}2. LED SET GET PORT/PIN VERIFY ${COLOR_REST}\n"
  printf  "${COLOR_RED_WD}3. BAD PARAMETER ${COLOR_REST}\n"
  printf  "${COLOR_RED_WD}======================================${COLOR_REST}\n"
  printf  "CHOOSE ONE TO TEST: "
  read -p "" input

  if [ "$input" == 1 ]; then
    LED
  elif [ "$input" == 3 ]; then
    LED_set_get
  elif [ "$input" == 4 ]; then
    parameter
  fi

done