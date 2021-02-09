#!/usr/bin/env bash

set -e

KRYPTON_PORT=2221
KRYPTON_URL=krypton.labs.overthewire.org
KRYPTON_USER=krypton
KRYPTON_SSH_OPTS=

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
keyfile=krypton${level}_key

if [ -z "$level" ]
then
    help
fi

awk "/^$level/ { print \$2 }" passwords

if [ -f "${keyfile}" ]
then
    chmod 600 ${keyfile}
    KRYPTON_SSH_OPTS="${KRYPTON_SSH_OPTS} -i ${keyfile}"
fi


ssh ${KRYPTON_USER}${level}@${KRYPTON_URL} -p ${KRYPTON_PORT} ${KRYPTON_SSH_OPTS} ${@}
