#!/usr/bin/env bash


readarray -t output <<< $(acpi battery)
battery_count=${#output[@]}

for line in "${output[@]}";
do
    percentages+=($(echo "$line" | grep -o -m1 '[0-9]\{1,3\}%' | tr -d '%'))
    statuses+=($(echo "$line" | egrep -o -m1 'Discharging|Charging|AC|Full|Unknown'))
    remaining=$(echo "$line" | egrep -o -m1 '[0-9][0-9]:[0-9][0-9]')
    if [[ -n $remaining ]]; then
        remainings+=(" ($remaining)")
    else
        remainings+=("")
    fi
done


end=$(($battery_count - 1))
for i in $(seq 0 $end);
do
    if (( percentages[$i] > 0 && percentages[$i] < 25  )); then
        squares="$percentages%"
    elif (( percentages[$i] >= 20 && percentages[$i] < 50 )); then
        squares="$percentages%"
    elif (( percentages[$i] >= 40 && percentages[$i] < 75 )); then
        squares="$percentages%"
    elif (( percentages[$i] >= 60 && percentages[$i] < 100 )); then
        squares="$percentages%"
    elif (( percentages[$i] >=80 )); then
        squares="$percentages%"
    fi

    case "${statuses[$i]}" in
    "Charging")
        squares="charging "
    ;;
    "Full")
        squares=""
    ;;
    "AC")
        squares=""
    ;;
    esac
        message="$message $squares"
done

echo $message
