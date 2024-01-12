ARTIFACT_NAME=$1
TENANT_NAME=$2
ARTIFACT_VERSION=$3
STORES_LIST=$4

echo "all the store list: ${STORES_LIST}"

# Remove square brackets and quotes from the list
STORES_LIST=${STORES_LIST//[\[\]\"\'']}

# Split the list into an array
IFS=', ' read -ra STORES_ARRAY <<< "${STORES_LIST}"

echo "Updated format of store list:"

# Iterate through the array and print each store
for store in "${STORES_ARRAY[@]}"; do
    echo "$store"
done
