#!/usr/bin/env bash

set -e

LEVIATHAN_PORT=2223
LEVIATHAN_URL=leviathan.labs.overthewire.org
LEVIATHAN_USER=leviathan
LEVIATHAN_SSH_OPTS=

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
keyfile=leviathan${level}_key

if [ -z "$level" ]
then
    help
fi

awk "/^$level/ { print \$2 }" passwords

if [ -f "${keyfile}" ]
then
    chmod 600 ${keyfile}
    LEVIATHAN_SSH_OPTS="${LEVIATHAN_SSH_OPTS} -i ${keyfile}"
fi


ssh ${LEVIATHAN_USER}${level}@${LEVIATHAN_URL} -p ${LEVIATHAN_PORT} ${LEVIATHAN_SSH_OPTS} ${@}
