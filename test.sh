#!/bin/sh
set -e -u

sed -n '/^```json/,/^```/p;/^pattern2/q' README.md | sed '1d' | sed '$ d' \
    > from-readme.sample.json

for file in *sample.json; do
    echo "Verifying $file against schema..."
    jsonschema -i $file http-types-schema.json
done
