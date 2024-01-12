ARTIFACT_NAME=$1
TENANT_NAME=$2
ARTIFACT_VERSION=$3
STORES_LIST=$4  # Added the new input for the list of stores

echo "${STORES_LIST}"
IFS=' ' read -ra STORES_ARRAY <<< "${STORES_LIST}"

