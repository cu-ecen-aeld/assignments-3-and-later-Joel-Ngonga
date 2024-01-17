#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Error: Please provide both filesdir and searchstr as arguments."
    exit 1
fi

filesdir="$1"
searchstr="$2"
#abc
#nothing

#filesdir="$HOME$filesdir"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# Use find and grep to search for the string in files
#matching_lines=$(grep -r "$filesdir" "$searchstr" | wc -l)
#echo "we have $matching_lines
matching_lines=$(find "$filesdir" -type f -exec grep -r "$searchstr" {} + | wc -l)
number_of_files=$(find "$filesdir" -type f | wc -l)

echo "The number of files are $number_of_files and the number of matching lines are $matching_lines"
