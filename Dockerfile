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
RUN yum install  -y --installroot=$GOROOT golang.x86_64
#ENV TEMP_GOBIN /root/go1.4/bin
#RUN mkdir -p $TEMP_GOBIN 
RUN whereis go 
#RUN cd /usr/bin && ln -s go $TEMP_GOBIN/go
#RUN ls -las $TEMP_GOBIN 

RUN mkdir -p $GOROOT \
	&& cd $GOROOT \
	&& git clone https://github.com/golang/go.git .  \
	&& cd ./src \
	&& CGO_ENABLED=1 ./make.bash 





RUN $GOBIN/go version
RUN gcc -v