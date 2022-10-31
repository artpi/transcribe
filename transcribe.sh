#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

youtube-dl -f 250 --print-json -a inbox.md > output.json
filename=$(jq -r "._filename"  < ./output.json)
whisper -o ./transcriptions "./${filename}"
