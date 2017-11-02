#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/playlist_tracks/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "playlist_track": {
      "playlist_id": "'"${NEWPLID}"'",
      "track_id": "'"${NEWTID}"'"
    }
  }'

echo
