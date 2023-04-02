#!/bin/bash
# 1. Print first three lines of any test file
sed -n '1,3'p test.sh   # -n --> no of lines

# 2. Print whole text of the file
awk '{print}' test.sh

# 3. Print the lines with error word in the test file
awk /error/'{print}' test.sh

# version number update
awk -F'[.]' '/^version/{print $1"."$2"."$3"."$4+1}' test.sh    #-F -->format/find -->which divides the version 10.24.1.0 to $1=10,$2=24,$3=1,$4=0

#replace ten word with eleven in the test file
sed 's/ten/eleven/g' test.sh      # s -->source , g-->global -->change every instance in the file

# replace = to with space and print second value of variable.
echo $A | sed 's/=/ /g' | awk '{print $2}'
<<com
input: A=B=C
Output: C 
com

