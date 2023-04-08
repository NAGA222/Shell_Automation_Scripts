#script to monitor CPU, Memory and Disk usage and send the output to a file in table format

#!/bin/bash

# Output file
output_file=/tmp/system_monitoring.txt

# Get current date and time
date_time=$(date +"%Y-%m-%d %H:%M:%S")

# CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Memory usage
mem_total=$(free -m | grep "Mem:" | awk '{print $2}')
mem_used=$(free -m | grep "Mem:" | awk '{print $3}')
mem_percent=$(echo "scale=2; $mem_used/$mem_total*100" | bc)

# Disk usage
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')

# Write output to file in table format
echo "Date/Time | CPU Usage | Memory Usage | Disk Usage" >> $output_file
echo "-------------------------------------------------" >> $output_file
echo "$date_time | $cpu_usage% | $mem_percent% ($mem_used/$mem_total MB) | $disk_percent ($disk_used/$disk_total)" >> $output_file
