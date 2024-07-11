#!/bin/bash

# we are Deleting the log files
# For that we first mention the Folder
# After that we need to identify the folder is exit or not
# If it is there, in that we need to mention which file you need to delete, exact extension type
# and date like how many back days
# After that each file line by line you need to read and print and finally you delete the files

FOLDERNAME=/tmp/oldfiles
if [ -d $FOLDERNAME ]
then
    echo "Yes, the folder is Exist"
else
    echo "NO, please make sure your folder"
    exit 1
fi

FILES=$(find $FOLDERNAME -name "*.log" -mtime +60 )

while IFS= read -r line
do
    echo "This current files is Deleting : $line"
    rm -rf $line
    
done <<<$FILES