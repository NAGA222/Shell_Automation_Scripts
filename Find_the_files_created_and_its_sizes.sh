#Shell script to find the files created and its sizes. It should accept the number of days as input. Or a from and to date format as inputs.

#!/bin/bash

# Function to calculate the number of seconds between two dates
function date_to_seconds {
  date -d "$1" +%s
}

# Check if the user has provided the number of days or the date range
if [[ $# -eq 1 ]]; then
  # Calculate the date that was x days ago
  start_date=$(date -d "$1 days ago" +%F)
  end_date=$(date +%F)
else
  start_date=$1
  end_date=$2
fi

# Convert the start and end dates to seconds
start_seconds=$(date_to_seconds "$start_date")
end_seconds=$(date_to_seconds "$end_date")

# Find the files within the date range and display their sizes
find / -type f -newermt "$start_date" ! -newermt "$end_date" -exec du -h {} \;

<<com
Here's how to use this script:

Save the script to a file (e.g., find_files.sh).
Make the file executable by running chmod +x find_files.sh.
To find files created in the last x days, run ./find_files.sh x.
To find files created between two specific dates, run ./find_files.sh "YYYY-MM-DD" "YYYY-MM-DD".
The script works by first defining a function called date_to_seconds that converts a date to the number of seconds since January 1, 1970. This function is used later to convert the start and end dates to seconds.

Next, the script checks if the user has provided the number of days or the date range as inputs. If the user has provided the number of days, the script calculates the start date as x days ago and the end date as today's date. If the user has provided the date range, the script uses those dates as the start and end dates.

Finally, the script uses the find command to locate all files that were created within the specified date range. The -type f option tells find to only look for files, and the -newermt option is used to specify the date range. The -exec option is used to execute the du -h command on each file found, which displays the size of the file in a human-readable format.

Note: This script assumes that you want to search for files in the current directory and its subdirectories. If you want to search for files in a specific directory, you can replace the . in the find command with the path to that directory.

----> " date -d "$1" +%s " explain this
This command is used to convert a date string into a Unix timestamp, which represents the number of seconds since January 1, 1970, 00:00:00 UTC.

Here is a breakdown of the command:

date - This is the Linux/Unix command used to display or set the system date and time.

-d "$1" - This option tells the date command to use the value of the first argument passed to the script as the date to be converted.

+%s - This option tells the date command to output the result in the Unix timestamp format. The %s format specifier is used to specify the output format as seconds since the Unix epoch.

When the script executes this command with a date string as an argument, it first converts the date string to a Unix timestamp using the date command. The timestamp is then returned to the script and stored in a variable for further processing.

For example, if the argument passed to the script is "2022-01-01", the date command will output the Unix timestamp of "1640995200", which represents January 1, 2022, at 12:00:00 AM UTC.


 ---> "start_date=$(date -d "$1 days ago" +%F) " explain this

This command is used to calculate a date that is a specified number of days before the current date and store it in a variable called start_date.

Here is a breakdown of the command:

date - This is the Linux/Unix command used to display or set the system date and time.

-d "$1 days ago" - This option tells the date command to calculate a date that is a specified number of days before the current date. The value of the first argument passed to the script is used to specify the number of days.

+%F - This option tells the date command to format the output as a date in the format "YYYY-MM-DD". The %F format specifier is used to specify this format.

When the script executes this command with a number of days as an argument, it calculates the date that is that number of days before the current date using the date command. The date is then output in the format "YYYY-MM-DD" and stored in the start_date variable for further processing.

For example, if the argument passed to the script is "7", the date command will output the date that was 7 days ago from today's date in the format "YYYY-MM-DD", such as "2023-04-01". This date is then assigned to the start_date variable.

com
