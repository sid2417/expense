#!/bin/bash

# Deleting files:
# First declare the sourceDiretory
# Make sure that directory is exist or not
# if it is exist you proceed to Further steps
# Otherwise you have to specify the directory
# Once specify in that directory which files you need to delete
# And specify the extension file type
# And finally you loops and delete the records one by one

FOLDERNAME=/tmp/logfiles
if [ -d $FOLDERNAME ]
then
    echo "Your Directory is Exist"
else
    echo "Not available your directory, plese make sure that..."
fi