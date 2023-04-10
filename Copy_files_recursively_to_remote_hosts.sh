#!/bin/bash

# Array of remote hosts
hosts=(
    host1.example.com
    host2.example.com
    host3.example.com
)

# Path to source directory to copy from
src_dir=/path/to/source/directory/

# Path to destination directory to copy to on remote hosts
dest_dir=/path/to/destination/directory/

# Loop through each remote host and copy the files recursively
for host in "${hosts[@]}"
do
    echo "Copying files to $host"
    scp -r $src_dir $host:$dest_dir
    echo "Files copied to $host"
done

<<com
Here's a brief explanation of what each line does:

#!/bin/bash: This is called a shebang line and is used to specify which shell should be used to interpret the script. In this case, we're using bash.

hosts=(host1.example.com host2.example.com host3.example.com): This line defines an array called hosts with the list of remote hosts to copy files to.

src_dir=/path/to/source/directory/: This line defines the source directory to copy files from.

dest_dir=/path/to/destination/directory/: This line defines the destination directory to copy files to on the remote hosts.

for host in "${hosts[@]}": This line starts a loop that will iterate through each host in the hosts array.

echo "Copying files to $host": This line prints a message indicating which host we're copying files to.

scp -r $src_dir $host:$dest_dir: This line uses the scp command to recursively copy the files from the src_dir directory to the dest_dir directory on the remote host.

echo "Files copied to $host": This line prints a message indicating that the files have been successfully copied to the remote host.

To run the script, save it to a file (e.g. copy-files-to-remote-hosts.sh), make it executable using chmod +x copy-files-to-remote-hosts.sh, and then execute it using ./copy-files-to-remote-hosts.sh. 

Note that you will need to have SSH access to the remote hosts and have the necessary permissions to copy files to the destination directory.

com