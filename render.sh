#!/bin/sh
mkdir -p docs
pandoc -V documentclass=report -V classoption=oneside -V geometry:vmargin=14.5mm -V lang:de --fail-if-warnings --output=docs/summary.pdf md/*.md

# merge slides in slide folder
pdftk slides/*.pdf cat output docs/slides.pdf