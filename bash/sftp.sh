#!/usr/bin/env bash

SSH_HOSTNAME=hostname
SSH_USER=user
SSH_PRIVATE=~/.ssh/id_dsa
SSH_PUBLIC=${PRIVATE}.pub
SSH_REMOTE_DIR=/path/to/remote/directory
SSH_BATCH=$(mktemp)

echo 'lcd $(dirname $0)/../conf' > ${SSH_BATCH}
echo 'get something.txt' >> ${SSH_BATCH}

ssh-keygen -t dsa -b 2048 -N '' -f ${SSH_PRIVATE}
ssh-copy-id -i ${SSH_PUBLIC} ${SSH_USER}@${SSH_HOSTNAME}
rm ${SSH_PUBLIC}

sftp -oIdentityFile=${SSH_PRIVATE} -b sftp_batch.txt ${SSH_USER}@${SSH_HOSTNAME}:${SSH_REMOTE_DIR}