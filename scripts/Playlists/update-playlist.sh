#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/playlists/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
 "playlist": {
   "name": "The Name",
      "track_ids": ["8"]
 }
}'

echo
