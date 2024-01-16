#!/bin/bash

ARTIFACT_NAME=$1
TENANT_NAME=$2
ARTIFACT_VERSION=$3
STORES_LIST=$4
CANARY_STORES=$5

  echo "bjhbjhbjhbj: $CANARY_STORES"
 
  echo "samplesdcsdc"



echo "ARTIFACT_NAME: $ARTIFACT_NAME"
echo "STORES_LIST: $STORES_LIST"

# Remove square brackets and quotes from STORES_LIST
names_to_filter=$(echo "$STORES_LIST" | sed 's/[][]//g; s/,/, /g; s/,//g')

echo "names_to_filter: $names_to_filter"

pwd
ls
cat data.json

json_data=$(cat data.json)

# Use jq to filter data based on the provided names
filtered_data=$(echo "$json_data" | jq --arg server_filter "$names_to_filter" '.[] | select(.server_name as $item | ($server_filter | split(" ") | index($item)) // empty)')

echo "$filtered_data"
