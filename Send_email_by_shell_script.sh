#!/bin/bash
#install dependencies

sudo yum install -y mailx

to="test_receipint@test.com"
subject="Test Email subject"
body="This is a test email sent from an EC2 Linux instance."

echo "$body" | mail -s "$subject" "$to"

