#!/usr/bin/env bash
set -e

# Main flux script

# Look for scripts in this directory
BINDIR="$(dirname "$0")"
LIBDIR="$(dirname ${BINDIR})/lib"

# Create an argument array
ARGARRAY=("$@")


# Execute commands

# Iterate from the full length of the argument array backwards
for i in $(seq ${#ARGARRAY[@]} -1 1)
do
    # Construct the path to command from the subarray
    COMPATH=$LIBDIR$(printf '/%s' "${ARGARRAY[@]:0:$i}")

    # If this command path is a valid script, execute it 
    # with the remaining part of the array as arguments.
    if [[ -f $COMPATH && -x $COMPATH ]]
        then
            $COMPATH "${ARGARRAY[@]:$i:${#ARGARRAY[@]}}"
            exit 0
    # If it is a directory, find the 'main' script and
    # execute that with the arguments of the array.
    elif [[ -d $COMPATH ]]
        then
            $COMPATH/main "${ARGARRAY[@]:$i:${#ARGARRAY[@]}}"
            exit 0
    else
        continue
    fi
done


