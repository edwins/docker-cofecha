#!/bin/bash

set -e

JOB=${1}
FILE=${2}
TITLE=${3}

# echo "job = $JOB"
# echo "file = $FILE"
# echo "title = $TITLE"

if [ ! -e $FILE ]; then
    echo "?File '$FILE' does not exist"
    exit 1
fi

echo -e "${JOB}\r\nz:\\\data\\${FILE}\r\ny\r\n\r\n${TITLE}\r\n"|wine COFECHA.EXE
# exec "$@"