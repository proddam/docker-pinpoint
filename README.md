# docker-pinpoint

This repo contains the docker images for [Pinpoint](https://github.com/naver/pinpoint), or you can just use the docker compose file run pinpoint in seconds.

### Build the images
* Go to a folder pinpoint-web `docker build -t proddam/pinpoint-web:1.8.0 .` to build the image
* Go to a folder pinpoint-hbase `docker build -t proddam/pinpoint-hbase:1.8.0 .` to build the image
* Go to a folder pinpoint-collector `docker build -t proddam/pinpoint-collector:1.8.0 .` to build the image
* Go to a folder pinpoint-agent `docker build -t proddam/pinpoint-agent:1.8.0 .` to build the image

### How to Run 
```
docker-compose up -d
```

### How to See if it works
- pinpoint-web: http://localhost:8181
- pinpoint-app: http://localhost:18080
