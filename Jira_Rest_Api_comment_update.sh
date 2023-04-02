#!/bin/bash
version="1.2.3.0"
for line in $(cat jiraid.txt)
do
#curl -X PUT -u "usergmail:token --data '{"update":{"labels":[{"add":"Storage-Issue"}]}}' -H "Content-Type: application/json" https://therealyou.atlassian.net/rest/api/3/issue/DP-1

curl -X PUT -u "usergmail:token" --data '{"update":{"comment":[{"add":{"body": "Sample New Comment adding using Rest API"}}]}}' -H "Content-Type: application/json" https://therealyou.atlassian.net/rest/api/2/issue/$line
done