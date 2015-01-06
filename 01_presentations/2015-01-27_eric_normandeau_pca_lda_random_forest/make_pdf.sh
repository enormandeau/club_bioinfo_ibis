#!/bin/bash
pandoc -s -V fontsize=12pt -V geometry:margin=1in -V documentclass:article presentation_template.md -o presentation_template.pdf

