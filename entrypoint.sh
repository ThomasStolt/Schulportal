#!/bin/sh
# Replaces ${KURSWAHL_URL} and ${NACHSCHREIBER_URL} in index.html at container start.
# Uses the template so restarts with different env vars always work correctly.
envsubst '${KURSWAHL_URL} ${NACHSCHREIBER_URL}' \
  < /usr/share/nginx/html/index.html.template \
  > /usr/share/nginx/html/index.html
exec nginx -g 'daemon off;'
