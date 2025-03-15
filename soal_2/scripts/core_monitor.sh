V#!/bin/bash

LOG_FILE="./log/core.log"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

cpu_model=$(lscpu | grep "Model name" | sed -e 's/Model name: *//')

current_time=$(date "+%Y-%m-%d %H:%M:%S")

echo "$current_time - Core Usage [$cpu_usage%] - Terminal Model [$cpu_model]" >> "$LOG_FILE"
