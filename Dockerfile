# Centos with the latest golang installed

# Installs via godeb
# Installs gcc 

# 

FROM centos:latest
MAINTAINER sndnvaps@gmail.com
ENV GOPATH /usr/local/lib/go
ENV GOROOT /usr/local/go
ENV GOBIN $GOROOT/bin 

RUN yum update -y
RUN yum install -y gcc
RUN yum install -y bzr
RUN yum install -y git 
RUN yum install  -y golang.x86_64 
ENV TEMP_GOBIN /root/go1.4/bin
RUN mkdir -p $TEMP_GOBIN \
		&& ln -s $(whereis go) $TEMP_GOBIN/go

RUN mkdir -p $GOROOT \
		&& cd $GOROOT \
		&& git clone https://github.com/golang/go.git . \
		&& cd ./src \
		&& CGO_ENABLED=1 ./make.bash 

#RUN go get launchpad.net/godeb
#RUN /usr/local/lib/go/bin/godeb --help
#RUN yum remove -y golang.x86_64 
#RUN /usr/local/lib/go/bin/godeb list 
#RUN /usr/local/lib/go/bin/godeb install 1.5.1




RUN $GOBIN/go version
RUN gcc -v