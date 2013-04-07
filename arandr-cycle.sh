#!/bin/bash
cycle_state_path="./.arandr-cycle-state"
layout_path="/home/${USER}/.screenlayout"
current_state=$(cat $cycle_state_path)
let next_state=current_state+1

i=0
for entry in $layout_path/*
do
    arandr_list[i]="$entry"
    ((i++))
done

echo "Total layouts: $i"
echo "List of available layouts:"
for layout in ${arandr_list}
do
    echo $layout
done
#echo "${arandr_list[0]}"
#echo "${arandr_list[1]}"

echo "Current State: ${current_state}"
let next_state=next_state%i
echo "Next State: ${next_state}"

echo $next_state > $cycle_state_path
echo "Using ${arandr_list[$current_state]}"
${arandr_list[$current_state]}

exit 0
