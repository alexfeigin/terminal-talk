jcurl() {
  local url=$1
  local token=$2
  local data=$3
  ## if data is not empty, then it is a POST request, otherwise get
  if [[ -n $data ]]; then
    curl -s "${url}" -H "Authorization: Bearer ${token}" -H "Content-Type: application/json" -d "${data}" | jq
  else
    curl -s "${url}" -H "Authorization: Bearer ${token}" | jq
  fi
}