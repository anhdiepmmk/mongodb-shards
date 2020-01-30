# mongodb-shards
Thực hành tạo mongodb shards sử dụng các công cụ docker, docker compose

### Bước 1:
chạy lệnh `docker-compose` để tạo các container router, config, shard
`docker-compose up`


### Bước 2:
chạy script `init.sh` để `initiate` các router, config, shard với nhau
`./init.sh`

### Bước 3:
Bật chế độ shard cho database
```docker exec -it router mongo
sh.enableSharding("my_db")```

### Bước 4:
kiểm tra kết quả
`docker exec -it router bash -c  "echo 'sh.status()' | mongo"`

```
MongoDB shell version v4.2.0
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("6f3bcbd7-b218-448f-96a2-9a7b993931ea") }
MongoDB server version: 4.2.0
--- Sharding Status ---
  sharding version: {
  	"_id" : 1,
  	"minCompatibleVersion" : 5,
  	"currentVersion" : 6,
  	"clusterId" : ObjectId("5e32b18557fc1d132feea6cc")
  }
  shards:
        {  "_id" : "shard01",  "host" : "shard01/shard01a:27018,shard01b:27018",  "state" : 1 }
        {  "_id" : "shard02",  "host" : "shard02/shard02a:27019,shard02b:27019",  "state" : 1 }
        {  "_id" : "shard03",  "host" : "shard03/shard03a:27020,shard03b:27020",  "state" : 1 }
  active mongoses:
        "4.2.0" : 1
  autosplit:
        Currently enabled: yes
  balancer:
        Currently enabled:  yes
        Currently running:  no
        Failed balancer rounds in last 5 attempts:  0
        Migration Results for the last 24 hours:
                No recent migrations
  databases:
        {  "_id" : "config",  "primary" : "config",  "partitioned" : true }
                config.system.sessions
                        shard key: { "_id" : 1 }
                        unique: false
                        balancing: true
                        chunks:
                                shard01	1
                        { "_id" : { "$minKey" : 1 } } -->> { "_id" : { "$maxKey" : 1 } } on : shard01 Timestamp(1, 0)

bye
```




