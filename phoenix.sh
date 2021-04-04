#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "${GREEN}- STOPPING CONTAINERS...${NC}"
docker-compose stop

echo "${GREEN}- DELETING CONTAINERS...${NC}"
docker container rm $(docker container ls -aq)

echo "${GREEN}- DELETING IMAGES...${NC}"
docker image rm $(docker image ls -aq) --force

echo "${GREEN}- REBUILDING...${NC}"
docker-compose up -d --build

echo "${GREEN}- DONE${NC}"