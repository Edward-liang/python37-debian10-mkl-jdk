FROM registry.cn-hangzhou.aliyuncs.com/edward-liang/python37-debian10-mkl:v1.1.0

ADD https://cdn.azul.com/zulu/bin/zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz /usr/local/lib
ENV JAVA_HOME /usr/local/lib/openjdk

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    gcc-multilib

