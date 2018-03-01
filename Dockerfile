FROM python:2-alpine3.7

RUN sed -i "s|dl-cdn.alpinelinux.org|mirrors.tuna.tsinghua.edu.cn|g" /etc/apk/repositories && \
apk add -U tzdata && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && \
apk add -U gcc g++ musl-dev libxft-dev && \
pip install --no-cache-dir cython numpy pystan fbprophet && \
apk del gcc musl-dev libxft-dev && \
rm -rf /var/cache/apk/*
