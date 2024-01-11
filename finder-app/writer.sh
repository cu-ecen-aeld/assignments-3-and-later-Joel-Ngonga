#! /bin/sh

#check if we have two arguments passed in the script

if [ "$#" -ne 2 ]; then
	echo "no two arguments found"
	exit 1
fi

#copy the argument to two variables 

filename=$1
filecontent=$2

# expand file name by adding home directory 

#filename="$HOME$filename"


#extract directory name from filename
dir_path="$(dirname "$filename")"
#echo " lets get the directory .... $dir_path"

#check if directory exist and create it if it does not exist
if [ ! -d "$dir_path" ]; then 
	mkdir -p "$dir_path"
	#echo "directory :  created "
fi

#check if file exists or create it if it does not exist

if [ ! -e "$filename" ]; then
	touch "filename"
	#echo "file created"
	#exit with value 1 and print statement if file could not be created
	if [ $? -ne 0 ]; then
            echo "Error: Could not create the file $filename"
            exit 1
    	fi
fi

# overwrite content to file 
echo "$filecontent" > "$filename"

#echo "good job we are none now"
