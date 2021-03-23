#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Usage: ./run.sh <module name>"
    exit 0
fi

PATH=_build/src/$1.native

if [ ! -f "$PATH" ] ; then
    echo "Native code not found, did you compile?"
    exit 0
fi

./$PATH