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

echo ""
echo "Copy docker files..."
echo ""
for module in game-server login-server web-server; do
  cp "docker/${module}/Dockerfile" "${module}/Dockerfile"
  cp docker/dockerignore "${module}/.dockerignore"
done

echo ""
echo "Merge web-server and web-ui..."
echo ""
mv web-ui web-server/

echo ""
echo "Copy l2js files..."
echo ""
cp docker/game-server/config/* game-server/config/
cp docker/login-server/config/* login-server/config/
cp docker/web-server/server.js web-server/
mkdir -p docker/initdb
curl -o docker/initdb/l2db.sql https://raw.githubusercontent.com/Lineage2JS/scripts/refs/heads/main/l2db.sql

echo ""
echo "Building docker images..."
echo ""
for module in game-server login-server web-server; do
  docker build -t "${module}:latest" "${module}/"
done
