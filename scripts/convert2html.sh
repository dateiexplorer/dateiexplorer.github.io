#!/bin/bash

# Don't execute this script. 
exit 0

# Get all markdown files from this point
for file in $(find * -iname "*.md"); do
    # Make sure that all directories exist
    mkdir -p "html/$(dirname "$file")"
    # Convert markdown files to html files
    pandoc -i "$file" -o "html/${file%.md}.html";
done
