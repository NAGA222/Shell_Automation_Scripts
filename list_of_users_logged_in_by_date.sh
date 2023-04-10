#!/bin/bash

echo "Enter the date (YYYY-MM-DD format) to list users logged in:"
read date

echo "Listing users logged in on $date"

who | grep $date > logged-in-users.txt

echo "Output written to logged-in-users.txt file."

<<com 
Here's a brief explanation of what each line does:

#!/bin/bash: This is called a shebang line and is used to specify which shell should be used to interpret the script. In this case, we're using bash.

echo "Enter the date (YYYY-MM-DD format) to list users logged in:": This line prints a message asking the user to enter a date in YYYY-MM-DD format.

read date: This line reads the input from the user and stores it in a variable called date.

echo "Listing users logged in on $date": This line prints a message indicating that we're about to list users logged in on the specified date.

who | grep $date > logged-in-users.txt: This line uses the who command to list all users currently logged in, pipes the output to grep which filters the output to only show entries with the date provided by the user, and then redirects the filtered output to a file called logged-in-users.txt.

echo "Output written to logged-in-users.txt file.": This line prints a message indicating that the output has been written to the file.

To run the script, save it to a file (e.g. list-users-by-date.sh), make it executable using chmod +x list-users-by-date.sh, and then execute it using ./list-users-by-date.sh.

com