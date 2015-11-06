
# DockerName: sndnvaps/docker-golang _8080

FROM sndnvaps/docker-golang
MAINTAINER sndnvaps@gmail.com
ENV GOROOT /usr/local/go

RUN go get github.com/sndnvaps/goblog
RUN go get github.com/beego/bee 

EXPOSE 8080 

