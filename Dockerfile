FROM registry.cn-hangzhou.aliyuncs.com/edward-liang/python37-debian10-mkl:v1.0.0
# install gcc .etc. to prevent GPL license problem.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    gcc-multilib \
    curl

RUN curl -O https://cdn.azul.com/zulu/bin/zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz && \
    tar -zxf zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz -C /usr/local/lib/ && \
    rm -f zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz && \
    mv /usr/local/lib/zulu8.28.0.1-jdk8.0.163-linux_x64 /usr/local/lib/openjdk

ENV JAVA_HOME /usr/local/lib/openjdk

RUN ls /usr/local/lib/openjdk
