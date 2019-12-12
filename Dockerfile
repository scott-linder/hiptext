FROM ubuntu:19.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get -y install build-essential autoconf pkg-config libjpeg-dev \
    libavcodec-dev libavformat-dev libavutil-dev libgoogle-glog-dev libpng-dev \
    libswscale-dev libfreetype6-dev libgflags-dev ragel && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/hiptext
COPY . .

RUN ./autogen.sh
RUN ./configure
RUN make -j4
RUN make install
