#!/usr/bin/env bash

FTP_HOSTNAME=example.com
FTP_USER=user
FTP_PASSWORD=passowrd
FTP_LOCAL_DIR=/path/to/local/directory
FTP_REMOTE_DIR=/path/to/remote/directory
FTP_FILES=(file1.txt file2.txt file3.txt)

#change mget to mput to put files

ftp -nv ${FTP_HOSTNAME} <<EOT
  user ${FTP_USER} ${FTP_PASSWORD}
  prompt
  binary
  lcd ${FTP_LOCAL_DIR}
  cd ${FTP_REMOTE_DIR}
  mget ${FTP_FILES[@]}
  quit
EOT