#!/usr/bin/env bash

IP=$1

if [[ ! -n "$IP" ]]; then
  echo "No IP provided, use: ${0} 1.2.3.4"
  exit 1
fi

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v portainer_agent_data:/data \
  -p ${IP}:9001:9001 \
  --restart always \
  --name portainer_edge_agent \
  portainer/agent:2.15.1
 
