#!/bin/bash
version="1.2.3.0"
for line in $(cat jiraid.txt)
do
#curl -X PUT -u "therealyou2222@gmail.com:ATATT3xFfGF0BIo8kk8Xie55QWvtMYgmyiyLYLCL3YrZ7Rf4yfuZoe90k84aKHwdnxu_96mZnZ2x3oX6clcaCHF2vBVqTeJe7iI5VqRrOIUZzek5sD_ck-xHy0zM6zDcaGPlQHOFB4JjtP47sVES4ZsGE52XOllgDg8JObPdksSbCjopmG-1X6k=CB95950F" --data '{"update":{"labels":[{"add":"Storage-Issue"}]}}' -H "Content-Type: application/json" https://therealyou.atlassian.net/rest/api/3/issue/DP-1
#curl -X PUT -u "therealyou2222@gmail.com:ATATT3xFfGF0BIo8kk8Xie55QWvtMYgmyiyLYLCL3YrZ7Rf4yfuZoe90k84aKHwdnxu_96mZnZ2x3oX6clcaCHF2vBVqTeJe7iI5VqRrOIUZzek5sD_ck-xHy0zM6zDcaGPlQHOFB4JjtP47sVES4ZsGE52XOllgDg8JObPdksSbCjopmG-1X6k=CB95950F" --data '{"update":{"labels":[{"add":"Storage-Issue"}]}}' -H "Content-Type: application/json" https://therealyou.atlassian.net/rest/api/3/issue/$line

curl -X PUT -u "therealyou2222@gmail.com:ATATT3xFfGF0BIo8kk8Xie55QWvtMYgmyiyLYLCL3YrZ7Rf4yfuZoe90k84aKHwdnxu_96mZnZ2x3oX6clcaCHF2vBVqTeJe7iI5VqRrOIUZzek5sD_ck-xHy0zM6zDcaGPlQHOFB4JjtP47sVES4ZsGE52XOllgDg8JObPdksSbCjopmG-1X6k=CB95950F" --data '{"update":{"comment":[{"add":{"body": "Sample New Comment adding using Rest API"}}]}}' -H "Content-Type: application/json" https://therealyou.atlassian.net/rest/api/2/issue/$line
done