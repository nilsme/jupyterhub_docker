#!/bin/bash
JUPYTER_USER=$1
JUPYTER_PASS=$2
docker exec jupyterhub_docker_app useradd -m $JUPYTER_USER
echo -e "$JUPYTER_PASS\n$JUPYTER_PASS" | docker exec -i jupyterhub_docker_app passwd $JUPYTER_USER