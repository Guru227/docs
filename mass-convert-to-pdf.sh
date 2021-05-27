#!/bin/bash
mkdir output;find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "./output/$(basename "${0%.md}".pdf)"' {} \;