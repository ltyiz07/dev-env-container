#! /bin/bash

connections=(
    "ssh ubuntu@193.123.239.123    # oracle ins-1"
    "ssh ubuntu@193.123.250.119    # oracle ins-2"
    # "ssh ubuntu@34.83.209.125    # google ins-1"
    "ssh young@ltyiz07.iptime.org    # rasberry-pi"
    "ssh base@tesser-pcdrcchgdnc.dynamic-m.com -p 222"
    "ssh -J base@tesser-pcdrcchgdnc.dynamic-m.com:222 young@172.24.208.232 -p 2222  # Tesser my PC"
)

for i in ${!connections[@]}; do
    echo "$((i + 1)) - ${connections[$i]}"
done

read -p "Enter number: " order

eval ${connections[$((order - 1))]}
