@echo off

echo Building Maven...
call mvn clean package -DskipTests

echo Building Docker image...
docker build -t study-app .

echo Stop old container...
docker rm -f study-container

echo Run new container...
docker run -d -p 8083:8082 --name study-container study-app

echo Clean images...
docker image prune -f

echo Deploy success
