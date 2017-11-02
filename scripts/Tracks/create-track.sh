#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "track": {
      "title": "'"${TITLE}"'",
      "artist": "'"${ARTIST}"'",
      "host_url": "'"${HOSTURL}"'"
    }
  }'

echo
