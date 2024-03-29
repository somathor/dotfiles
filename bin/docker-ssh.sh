#!/bin/bash -e

# docker id might be given as a parameter
DID=$1

if [[ "$DID" == "" ]]; then
  # if no id given simply just connect to the first running instance
  DID=$(docker ps | grep -Eo "^[0-9a-z]{8,}\b")
fi

docker exec -i -t $DID zsh
