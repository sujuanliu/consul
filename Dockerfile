#FROM alpine:3.7
FROM centos:7
MAINTAINER Sujuan Liu <sujuanliu@gmail.com>
COPY consul /opt/
WORKDIR /opt
ENV CONSUL_VERSION=1.2.2
ENV PARMS=""

# create user for consul
RUN adduser consul && \
    mkdir -p /consul/data /consul/config && \
    chown -R consul:consul /consul
USER consul

# RPC calls between consul servers and clients
EXPOSE 8300

# Serf LAN and WAN used for consul gossip
EXPOSE 8301 8301/udp 8302 8302/udp

# HTTP and DNS(both TCP and UDP) calls used for the interaction with consul
EXPOSE 8500 8600 8600/udp 

VOLUME /consul

ENTRYPOINT ["sh","-c","./consul agent $PARMS -data-dir /consul/data -config-dir /consul/config -enable-script-checks=true"]
