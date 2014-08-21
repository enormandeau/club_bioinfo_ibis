#!/bin/bash
INPUT=$1
OUTPUT=$2
pandoc -t dzslides -s $INPUT -o $OUTPUT

