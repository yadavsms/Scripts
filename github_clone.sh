#!/bin/bash
#Purpose : To clone github repo

github_url="https://github.com"
cat ~/github2 | sed -n '1801,2000p' > ~/repo_2000
repofile=~/repo_2000
while read line 
do 	
	repo=`echo $line | awk -F[~] '{ print $2"/"$3}'`
	echo "$github_url/$repo"
	cd /home/pramati/betterdocs_data/github && git clone $github_url/$repo
	sleep 60
done < $repofile
