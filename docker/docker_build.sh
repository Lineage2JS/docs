#!/bin/bash

set -e

echo "Downloading files..."
echo ""

repos=(
  "https://github.com/Lineage2JS/game-server.git"
  "https://github.com/Lineage2JS/login-server.git"
  "https://github.com/Lineage2JS/web-server.git"
  "https://github.com/Lineage2JS/web-ui.git"
)

for repo in "${repos[@]}"; do
  git clone "$repo"
done

echo "Copy docker files..."

for module in game-server login-server web-server; do
  cp "docker/${module}/Dockerfile" "${module}/Dockerfile"
  cp docker/dockerignore "${module}/.dockerignore"
done

echo "Merge web-server and web-ui..."
mv web-ui web-server/

echo "Copy l2js files..."
cp docker/game-server/config/* game-server/config/
cp docker/login-server/config/* login-server/config/
cp docker/web-server/server.js web-server/

for module in game-server login-server web-server; do
  docker build -t "${module}:latest" "${module}/"
done
