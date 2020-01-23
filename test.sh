#!/bin/sh
set -e -u

for file in *sample.json; do
    echo "Verifying $file against schema..."
    jsonschema -i $file http-types-schema.json
done
