FROM alpine:latest

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

ENV JACKETT_VERSION 0.8.225

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk add --no-cache --update curl openssl libcurl tar bzip2 mono --update-cache --repository http://alpine.gliderlabs.com/alpine/edge/testing/ --allow-untrusted  && \
    mkdir -p /opt/jackett && curl -sL https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.Mono.tar.gz | tar xz -C /opt/jackett --strip-components=1 && \
    mkdir -p /config && \
    chown -R jackett:jackett /config /opt/jackett && \
    ln -s /config /opt/jackett && \
    rm -rf /tmp/* 
   
EXPOSE 9117 

WORKDIR /opt/jacket


VOLUME '/config'

LABEL url=https://api.github.com/repos/Jackett/Jackett/releases/latest
LABEL name=Jackett
LABEL version=${JACKETT_VERSION}

USER ${USER}

ENTRYPOINT ["mono", "JackettConsole.exe"]
