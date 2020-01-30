#!/bin/bash

docker exec -it config01 sh -c "mongo --port 27017 < /scripts/init-configserver.js"
docker exec -it shard01a sh -c "mongo --port 27018 < /scripts/init-shard01.js"
docker exec -it shard02a sh -c "mongo --port 27019 < /scripts/init-shard02.js"
docker exec -it shard03a sh -c "mongo --port 27020 < /scripts/init-shard03.js"
sleep 20
docker exec -it router sh -c "mongo < /scripts/init-router.js"
