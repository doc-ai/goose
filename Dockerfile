# DOCKER-VERSION 0.11.1

WORKDIR /go/src/app

#base the docker container off of a trusted golang image
FROM golang:1.11.4-stretch

#install prerequisites
RUN apt-get update & \
    apt-get install -y gcc & \
    apt-get clean

#install goose
RUN go get 'bitbucket.org/liamstask/goose/cmd/goose'

#mount the app
#RUN mkdir -p /opt/go/app/db
#ADD ./dbconf.yml /opt/go/app/db/dbconf.yml
#ONBUILD ADD ./migrations /opt/go/app/db/migrations

#define go as the entrypoint
ENTRYPOINT ["/go/bin/goose", "--env=default"]
CMD ["up"]
