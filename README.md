# Consul Image Build by sujuanliu

* This image build is based on centos 7 OS, and consul with version v1.2.2 is downloaded
via https://www.consul.io/downloads.html.

* Since this image build is used for consul cluster setup, it is suggested that consul server nodes number is 3 or 5
hosted on different servers. Moreover, those servers are host net metric when running docker container.

* When starting consul server/client mode, you need to set PARAM env variable as needed. Below is an example:
# Start a consul server mode:
 docker run -d --net=host -e PARMS="-server -bootstrap-expect 2 -node=<NODE_NAME> -bind=<SERVER_EXTERNAL_IP> -datacenter=<DATACENTER>"
 -p 8300:8300 -p 8301:8301 -p 8302:8302 -p 8500:8500 -p 8600:8600 <DOCKER_REGISTRY_URL>/<IMAGE>

 # Start a consul client mode:
 docker run -d --net=host -e PARMS="-ui -join=<CONSUL_SERVER_IP> -client <SERVER_EXTERNAL_IP> -node=<NODE_NAME> -bind=<SERVER_EXTERNAL_IP> -datacenter=<DATACENTER>"
  -p 8301:8301 -p 8500:8500 -p 8600:8600 <DOCKER_REGISTRY_URL>/<IMAGE>
