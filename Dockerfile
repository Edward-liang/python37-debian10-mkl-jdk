FROM registry.cn-hangzhou.aliyuncs.com/edward-liang/python37-debian10-mkl:v1.0.0
# install gcc .etc. to prevent GPL license problem.
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        gcc \
        gcc-multilib \
        vim \
        curl \
        procps \
	cron \
	perl \
        locales && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    locale-gen zh_CN.UTF-8 &&\
    apt-get clean && \
    rm -r /var/lib/apt/lists/* && \
    rm /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV TZ='CST-8' \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8 \
    JAVA_HOME /usr/local/lib/openjdk

RUN curl -O https://cdn.azul.com/zulu/bin/zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz && \
    tar -zxf zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz -C /usr/local/lib/ && \
    rm -f zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz && \
    mv /usr/local/lib/zulu8.28.0.1-jdk8.0.163-linux_x64 /usr/local/lib/openjdk
