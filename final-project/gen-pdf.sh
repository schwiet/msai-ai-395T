#!/bin/bash

# Initialize variables
random_suffix=false

# Parse command-line options
while getopts ":r" opt; do
  case $opt in
    r)
      random_suffix=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift off the options and flags
shift $((OPTIND-1))

# Check if a file name is passed after options
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [-r] <file.tex>"
  exit 1
fi

# Extract the filename without the extension
filename=$(basename -- "$1")
base_name="${filename%.*}"

# Initialize jobname with base name
jobname=$base_name

# Append a random string if -r is specified
if [ "$random_suffix" = true ]; then
  random_string=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 12)
  jobname="${base_name}_${random_string}"
fi

# Compile the .tex file with pdflatex
pdflatex -jobname="${jobname}" "$1"
echo "\n \n ${base_name}------*(&(*&(*&-------"
bibtex ${base_name}
pdflatex -jobname="${jobname}" "$1"
pdflatex -jobname="${jobname}" "$1"

echo "PDF generated: ${jobname}.pdf"
