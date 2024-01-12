#!/bin/bash

json_data=$(cat data.json)

# Convert command-line arguments to a JSON array of strings
names_to_filter=($(printf '%s\n' "$@" | tr '\n' ',' | sed 's/,$//'))

# Use jq to filter data based on the provided names
filtered_data=$(echo "$json_data" | jq --arg names_to_filter "$names_to_filter" '.[] | select(.server_name as $item | ($names_to_filter | split(",") | index($item)) // empty)')

echo "$filtered_data"
