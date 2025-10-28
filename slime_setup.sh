docker pull lizhuofeng/agentflow-slime:latest

docker run --gpus all --ipc=host --shm-size=16g \
  --ulimit memlock=-1 --ulimit stack=67108864 \
  -it lizhuofeng/agentflow-slime:latest /bin/bash
