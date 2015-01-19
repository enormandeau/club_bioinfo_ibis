#!/bin/bash

# File to use
INPUT=$1

pandoc -s -V fontsize=12pt -V geometry:margin=1in -V documentclass:article $INPUT -o ${INPUT%.md}.pdf

