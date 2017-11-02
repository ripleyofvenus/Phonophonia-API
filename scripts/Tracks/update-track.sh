#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
	"track": {
		"title": "'"${NEWTITLE}"'",
    "artist": "'"${NEWARTIST}"'",
    "host_url": "'"${NEWURL}"'"
	}
}'

echo
