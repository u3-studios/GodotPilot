#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..

godot --export-release "Web"

INPUT_FILE=./docs/GodotPilot.html

# Check if the input file exists
if [ ! -f "${INPUT_FILE}" ]; then
    echo "Input file not found!"
    exit 1
fi

# Define the script to insert
script_to_insert='<script src="coi-serviceworker.js"></script>'

# Use sed to insert the script after </title>
sed -i '' -e 's#<\/title>#<\/title>'"$script_to_insert"'#' "${INPUT_FILE}"
