# docker-jackett

## Info:
Based on Alpine:latest

## Usage:
`docker rm -f jackett; docker run -d --restart always --network my-bridge --name jackett -v /docker/jackett:/config/Jackett -p 9117:9117 lukasmrtvy/docker-jackett`
