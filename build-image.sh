#!/bin/bash -ex
if [ "$1" == "v1" ]; then
  git clean -fd
  docker build -t api:v1 .
elif [ "$1" == "v2" ]; then
  sed -i 's/V1 of API working fine/V2 of API working fine/' index.js
  echo "Updated to V2 of API working fine"
  docker build -t api:v2 .
else
  echo "Usage: ./script.sh [v1|v2]"
  echo "Provide 'v1' to clean and build version 1 or 'v2' to update and build version 2."
fi
