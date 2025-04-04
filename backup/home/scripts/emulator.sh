#!/bin/bash


cd "/home/tailor/Android/Sdk/emulator"

devices=$(./emulator -list-avds)
number=0
device_list=()

for device in $devices
do
    echo "$number: $device"
    device_list+=("$device")
    number=$((number + 1))
done

read $device_number

./emulator -avd "${device[$device_number]}"
