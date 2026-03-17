#!/bin/sh
set -e

echo "📦 Build Maven..."
mvn clean package -DskipTests

echo "🐳 Build Docker Image..."
docker build -t study-app .

echo "🛑 Stop old container..."
docker rm -f study-container || true

echo "🚀 Run new container..."
docker run -d -p 8083:8082 --name study-container study-app

echo "🧹 Clean dangling images..."
docker image prune -f

echo "🎉 Deploy success!"
