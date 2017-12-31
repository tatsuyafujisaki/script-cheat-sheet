#!/usr/bin/env bash

#kill found processes
ps aux | grep "my_process_name" | awk '{ print $2 }' | xargs kill

#check if command exists
command -v foo > /dev/null 2>&1 || echo 'command not found.'

#one liner
true && { echo 'true1'; echo 'true2'; } || { echo 'false1'; echo 'false2'; }
false && { echo 'true1'; echo 'true2'; } || { echo 'false1'; echo 'false2'; }

#change timestamp
touch -d '2011/03/11' foo.txt

#tee both stdout and stderr
./foo.sh 2>&1 | tee -a foo.log

#delete first char
${VAR1#?}

#delete last char
${VAR1%?}

# set JAVA_HOME if not set
[ -z ${JAVA_HOME} ] && export JAVA_HOME=/path/to/javahome

#use DEFAULT_JAVA_HOME if JAVA_HOME not set
DEFAULT_JAVA_HOME=/path/to/javahome
${JAVA_HOME=${DEFAULT_JAVA_HOME}} yourclassfile

#create folder if not found
[ -e ${FOLDER1} ] || mkdir -p ${FOLDER1}

#get timstamp in yyyyymmdd
stat -c %y ${FILE1} | awk '{print $1}' | tr -d '-'

#Get alphabetically-first *.txt
ls /path/to/*.txt | head -1

#Get alphabetically-last *.txt
ls /path/to/*.txt | tail -1

#Get first-modified *.txt
ls -t /path/to/*.txt | tail -1

#Get last-modified *.txt
ls -t /path/to/*.txt | head -1

#Extract file from targz
tar fvxz foo.tar.gz -C /path/to/destination file_in_targz > /dev/null

#Get current shell name
echo $0