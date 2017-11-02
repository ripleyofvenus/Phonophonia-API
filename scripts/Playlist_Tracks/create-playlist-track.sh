#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/playlist_tracks"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "playlist_track": {
      "playlist_id": "'"${PLAYLISTID}"'",
      "track_id": "'"${TRACKID}"'"
    }
  }'

echo
