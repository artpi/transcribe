#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

youtube-dl -v -f 250 --print-json -a inbox.md > output.json
filename=$(jq -r "._filename"  < ./output.json)
echo "Transcribing ${filename}"
whisper -o ./transcriptions "./${filename}"
