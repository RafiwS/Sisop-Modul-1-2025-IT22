V#!/bin/bash

LOG_FILE="./log/fragment.log"

ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

ram_used=$(free -m | grep Mem | awk '{print $3}')
ram_total=$(free -m | grep Mem | awk '{print $2}')
ram_available=$(free -m | grep Mem | awk '{print $7}')

current_time=$(date "+%Y-%m-%d %H:%M:%S")

echo "$current_time - Fragment Usage [$ram_usage%] - Fragment Count [$ram_used MB] - Details [Total: $ram_total MB, Available: $ram_available MB]" >> "$LOG_FILE"
