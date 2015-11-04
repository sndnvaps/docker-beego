# Centos with the latest golang installed

# Installs via godeb
# Installs gcc 
# 
FROM centos:latest
MAINTAINER sndnvaps@gmail.com
ENV GOPATH /usr/local/lib/go
ENV GOROOT /usr/local/go
ENV GOBIN $GOROOT/bin 
ENV GOROOT_BOOTSTRAP $GOROOT
RUN yum update -y
RUN yum install -y gcc
#RUN yum install -y bzr
RUN yum install -y git 
RUN yum install  -y  golang.x86_64
RUN go env 
RUN whereis go 
RUN mkdir -p $GOROOT \
	&& cd $GOROOT \
	&& git clone https://github.com/golang/go.git .  \
	&& cd ./src \
	&& CGO_ENABLED=1 ./make.bash 

RUN $GOBIN/go version
RUN gcc -v