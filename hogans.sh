#!/bin/bash
set -x 
# script to loop through all hogans heroes episodes

#path
folder=/user/folder/to/files
number=$1



#for all inls $folder
touch list

count=1
while [ $count -le $number ] 
	do

		if [ -s list ]
			then
				echo "in progress"
			else
				ls -R $folder | grep avi >> list
		fi

		last=$(head -n 1 list)

		file=$folder/Season_*/$last
		vlc --fullscreen $file vlc://quit
		exit=$?
		if [ $exit -eq 0 ]; then
			tail -n +2 list > list.tmp && mv list.tmp list
		fi
	count=$((count+1));
	done
exit 0
