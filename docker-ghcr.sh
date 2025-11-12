#!/bin/bash

GHCR_SERVER="ghcr.io"

echo "AUTH: Docker GitHub Container Registry"

case "$1" in
   --login)
      echo "GitHub Container Registry LOGIN!"

      read -p "GitHub User: " GHCR_USER
      read -p "GitHub Token: " GHCR_TOKEN

      echo $GHCR_TOKEN | docker login $GHCR_SERVER -u $GHCR_TOKEN --password-stdin
      ;;
   --logout)
      echo "GitHub Container Registry LOGOUT!"
      docker logout ghcr.io
      ;;
   --help | -h | *)
      echo "Incorrect syntax"
      echo "   Options:"
      echo "      --login     authenticate with GitHub Container Registry (DEFAULT!)"
      echo "      --logout    disconnect from GitHub Container Registry"
      echo "      --help, -h  list available options"
   ;;
esac
