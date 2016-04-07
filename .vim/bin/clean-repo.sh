#!/bin/bash

echo 'Remove all tracked and untracked files? (Y/n)';
read rsp;
if [ "$rsp" == "Y" ]; then
	git clean -f -d -x
	exit 1
elif [ "$rsp" == "n" ]; then
	exit 1
else
	echo "Invalid response"
	exit 1
fi
