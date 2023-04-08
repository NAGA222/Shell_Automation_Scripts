#shell script to monitor CPU, Memory and Disk usage and send the output to a file in table format

#!/bin/bash

# Output file
output_file=/home/ec2-user/system_monitoring.txt

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


<<com
In this script, the output is written to a file specified by the output_file variable, which is /tmp/system_monitoring.txt in this example.

The date command is used to get the current date and time in the format YYYY-MM-DD HH:MM:SS.

The CPU usage is obtained by running the top command with the -bn1 option to output the data once and then exiting, and then using grep and awk to extract the CPU usage percentage.

The memory usage is obtained by running the free command and using grep and awk to extract the total memory, used memory, and calculate the memory usage percentage.

The disk usage is obtained by running the df command and using awk to extract the total disk space, used disk space, and disk usage percentage for the root filesystem /.

This command is used to assign the total disk space of the root file system ("/") to a variable named "disk_total" in a Linux or Unix environment.

*** df -h / | awk 'NR==2 {print $2}'

Here is a breakdown of the command:

df -h / - This command is used to display information about the file system of the root directory ("/"). The "-h" option is used to display the output in a human-readable format, making it easier to read and understand the disk space usage.

awk 'NR==2 {print $2}' - The output of the "df -h /" command is then piped into the "awk" command, which is used to filter and process the output. "NR==2" specifies that only the second line of the output should be processed, which contains information about the root file system. "{print $2}" specifies that only the second column of that line, which contains the total disk space, should be printed.

The output of the entire command is assigned to the variable "disk_total" using the variable assignment operator "=" at the beginning of the command.

Finally, the output is written to the specified file in table format using echo statements. The >> operator is used to append the output to the file, rather than overwriting it.

com



