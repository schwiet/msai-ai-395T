#!/bin/bash

# may need to first get apa.csl from an online repo, like:
# https://github.com/citation-style-language/styles/blob/master/apa.csl

pandoc \
  ml-chess-outcome-prediction.tex \
  --bibliography=references.bib \
  --citeproc -csl=apa.csl \
  -o ml-chess-outcome-prediction.docx