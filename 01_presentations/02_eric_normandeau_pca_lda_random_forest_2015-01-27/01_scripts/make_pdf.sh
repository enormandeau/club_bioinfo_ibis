#!/bin/bash

# File to use
INPUT=$1

pandoc -s -V fontsize=12pt \
    -V geometry:margin=0.5in \
    -V geometry:paperheight=6in \
    -V geometry:paperwidth=8in \
    -V documentclass:article \
    $INPUT \
    -o ${INPUT%.md}.pdf

