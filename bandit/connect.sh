#!/usr/bin/env bash

set -e

BANDIT_PORT=2220
BANDIT_URL=bandit.labs.overthewire.org
BANDIT_USER=bandit
BANDIT_SSH_OPTS=

function help {
    echo "Usage:"
    echo "./$(basename $0) <level>"
    echo
    echo "Where:"
    echo "- <level> is the number only"

    return 1
}

level=$1
shift 1
keyfile=bandit${level}_key

if [ -z "$level" ]
then
    help
fi

awk "/^$level/ { print \$2 }" passwords

if [ -f "${keyfile}" ]
then
    chmod 600 ${keyfile}
    BANDIT_SSH_OPTS="${BANDIT_SSH_OPTS} -i ${keyfile}"
fi


ssh ${BANDIT_USER}${level}@${BANDIT_URL} -p ${BANDIT_PORT} ${BANDIT_SSH_OPTS} ${@}
