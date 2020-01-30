#!/bin/sh
set -e -u

sed -n '/^```json/,/^```/p;/^pattern2/q' README.md | sed '1d' | sed '$ d' \
    > valid/from-readme.json

for file in valid/*.json; do
    echo "Verifying $file against schema..."
    jsonschema -i $file http-types-schema.json
done

#for file in invalid/*.json; do
    #echo "Verifying $file against schema..."
    #jsonschema -i $file http-types-schema.json
#done
