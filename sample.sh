ARTIFACT_NAME=$1
TENANT_NAME=$2
ARTIFACT_VERSION=$3
STORES_LIST=$4

echo "all the store list: ${STORES_LIST}"

IFS=' ' read -ra STORES_ARRAY <<< "${STORES_LIST}"

API_URL="https://edgeapi.radius.ai/edge"

STORE_LIST=""
# Loop through the specified stores and fetch the data for each
for store in "${STORES_ARRAY[@]}"; do
  echo "$store"
  store_data=$(curl -s --request GET "${API_URL}/dependency?tenant_name=${TENANT_NAME}&store_name=${store}" -H "CF-Access-Client-ID: ${CF_ACCESS_CLIENT_ID}" -H "CF-Access-Client-Secret: ${CF_ACCESS_CLIENT_SECRET}" | jq -rc '.[]')
  STORE_LIST="${STORE_LIST}${store_data}"  # Concatenate the data for each store
done


