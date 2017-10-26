# docker-jackett

## Info:
Based on Alpine:latest

## Usage:
`docker pull lukasmrtvy/docker-jackett ; docker rm -f jackett; docker run -d --restart always --network my-bridge --name jackett -v jackett:/config/Jackett -p 9117:9117 lukasmrtvy/docker-jackett`
