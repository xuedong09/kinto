FROM alpine

ENV CONFIG=https://raw.githubusercontent.com/xuedong09/kinto/master/config.json

RUN apk update && apk add --no-cache unzip tor ca-certificates && \
    wget -c https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip && \
    chmod 700 v2ray v2ctl
    
CMD nohup tor & \
    ./v2ray -config $CONFIG
