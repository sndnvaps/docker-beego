# Centos with the latest golang installed

# Installs via godeb
# Installs gcc 
# golang.x86_64 install path is /usr/lib/golang/bin/linux_amd64
# go binary  '/usr/lib/golang/bin/linux_amd64/go'
# /usr/bin/go 
# https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz

FROM centos:latest
MAINTAINER sndnvaps@gmail.com
ENV GOROOT /usr/local/go
ENV GOROOT1.5 /usr/local/go1.5
ENV GOBIN $GOROOT/bin 
ENV GOROOT_BOOTSTRAP $GOROOT
RUN yum update -y
RUN yum install -y gcc
#RUN yum install -y bzr
RUN yum install -y wget 
RUN yum install -y git 

ENV GOLANG_VERSION 1.5.1
ENV GOLANG_TAR_BALL go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_URL  https://storage.googleapis.com/golang/$GOLANG_TAR_BALL
ENV GOLANG_DOWNLOAD_SHA1 46eecd290d8803887dec718c691cc243f2175fe0

RUN wget $GOLANG_DOWNLOAD_URL  \
	&& echo "$GOLANG_DOWNLOAD_SHA1  $GOLANG_TAR_BALL" | sha1sum -c - \
	&& tar -C /usr/local -xzf $GOLANG_TAR_BALL \
	&& rm $GOLANG_TAR_BALL


ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH	
	
#RUN yum install  -y  golang.x86_64
RUN go env 
RUN whereis go 

RUN mkdir -p $GOROOT1.5 \
	&& cd $GOROOT1.5 \
	&& git clone https://github.com/golang/go.git .  \
	&& cd ./src \
	&& CGO_ENABLED=1 ./make.bash 

RUN $GOBIN/go version
RUN $GOROOT1.5/bin/go env 
RUN gcc -v