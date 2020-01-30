# mongodb-shards
Thực hành tạo mongodb shards sử dụng các công cụ docker, docker compose

### Bước 1:
chạy lệnh `docker-compose` để tạo các container router, config, shard
`docker-compose up`


### Bước 2:
chạy script `init.sh` để `initiate` các router, config, shard với nhau
`./init.sh`

### Bước 3:
kiểm tra kết quả
`docker exec -it router bash -c  "echo 'sh.status()' | mongo"`




