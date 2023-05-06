#!/bin/sh
mkdir -p docs
pandoc -V documentclass=report -V classoption=oneside -V geometry:vmargin=14.5mm -V lang:de --fail-if-warnings --output=docs/summary.pdf summaries/*.md

# merge slides in material folder
pdftk material/**/w*.pdf cat output docs/slides.pdf