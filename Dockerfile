FROM alpine:latest

ENV UID="1100"

RUN adduser -D -u ${UID} jackett && \
    apk add --update curl openssl libcurl tar bzip2 mono supervisor --update-cache --repository http://alpine.gliderlabs.com/alpine/edge/testing/ --allow-untrusted  && \
    mkdir -p /opt/jackett && VERSION=`curl -s https://api.github.com/repos/jackett/jackett/releases/latest |grep -w "\"name\":" | cut -d '"' -f 4 |head -1` && curl -sL https://github.com/jackett/jackett/releas$
    mkdir -p /config && \
    chown -R jackett:jackett /config /opt/jackett && \
    ln -s /config /opt/jackett && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

EXPOSE 9117 

WORKDIR /opt/jacket

USER jackett 

# ADD supervisord.conf /tmp/supervisord.conf

VOLUME '/config'

ENTRYPOINT ["mono", "JackettConsole.exe"]
