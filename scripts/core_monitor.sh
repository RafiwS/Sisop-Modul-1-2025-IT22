#!/bin/bash

# Lokasi file log untuk menyimpan hasil pemantauan
LOG_FILE="./log/core.log"

# Mendapatkan penggunaan CPU saat ini dalam persentase
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Mendapatkan model CPU dari perintah lscpu
cpu_model=$(lscpu | grep "Model name" | sed -e 's/Model name: *//')

# Mendapatkan waktu saat ini untuk mencatat log
current_time=$(date "+%Y-%m-%d %H:%M:%S")

# Menulis hasil ke file log dengan format yang sesuai
echo "$current_time - Core Usage [$cpu_usage%] - Terminal Model [$cpu_model]" >> "$LOG_FILE"
