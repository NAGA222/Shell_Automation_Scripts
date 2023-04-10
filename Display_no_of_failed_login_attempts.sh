#!/bin/bash

# Path to the log file
log_file=/var/log/auth.log

# Extract failed login attempts from the log file and store them in a temporary file
grep "Failed password" $log_file > failed-logins.tmp

# Extract IP addresses and locations from the temporary file and count the number of failed attempts for each
awk '{print $11}' failed-logins.tmp | sort | uniq -c | sort -rn | while read count ip; do
    location=$(geoiplookup $ip | awk -F ', ' '{print $2}')
    printf "%-15s %-30s %s\n" "$count" "$ip" "$location"
done

# Remove the temporary file
rm -f failed-logins.tmp


<<com

Here's a brief explanation of what each line does:

#!/bin/bash: This is called a shebang line and is used to specify which shell should be used to interpret the script. In this case, we're using bash.

log_file=/var/log/auth.log: This line defines the path to the log file that contains the login attempts.

grep "Failed password" $log_file > failed-logins.tmp: This line uses the grep command to extract all failed login attempts from the log file and stores them in a temporary file called failed-logins.tmp.

awk '{print $11}' failed-logins.tmp | sort | uniq -c | sort -rn | while read count ip; do: This line uses the awk command to extract the IP addresses from the failed-logins.tmp file, sorts them, removes duplicates and then counts the number of failed attempts for each IP. The output is then piped to a while loop that reads the count and IP address for each line.

location=$(geoiplookup $ip | awk -F ', ' '{print $2}'): This line uses the geoiplookup command to get the location for each IP address and stores it in a variable called location.

printf "%-15s %-30s %s\n" "$count" "$ip" "$location": This line uses the printf command to format and print the output, which includes the count of failed attempts, the IP address, and the location.

rm -f failed-logins.tmp: This line removes the temporary file that was created.

To run the script, save it to a file (e.g. failed-login-attempts.sh), make it executable using chmod +x failed-login-attempts.sh, and then execute it using ./failed-login-attempts.sh. Note that you will need to have the geoiplookup command installed to get the location information.

com