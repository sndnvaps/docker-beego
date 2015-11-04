# Centos with the latest golang installed

# Installs via godeb
# Installs gcc 

# 

FROM centos:latest
MAINTAINER sndnvaps@gmail.com
ENV GOPATH /usr/local/lib/go
RUN yum update -y
RUN yum install -y gcc
RUN yum install -y bzr
RUN yum install -y git 
RUN yum install  -y golang.x86_64 
RUN go get launchpad.net/godeb
RUN /usr/local/lib/go/bin/godeb --help

#RUN yum remove -y golang.x86_64 
RUN /usr/local/lib/go/bin/godeb list 

RUN /usr/local/lib/go/bin/godeb install 1.5.1

RUN go version
RUN gcc -v