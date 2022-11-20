#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
EXEC_PATH=$PWD

echo "Start building in: $ROOT_DIR"

cd $ROOT_DIR

if [[ $1 = "--ros" ]] || [[ $1 = "-r" ]]
  then
    docker build -t raisim-img -f $ROOT_DIR/docker/Dockerfile.ros $ROOT_DIR \
                                  --network=host \
                                  --build-arg BASE_DIST=ubuntu20.04 \
                                  --build-arg CUDA_VERSION=11.7.1
elif [[ $1 = "--vulkan" ]] || [[ $1 = "-v" ]]
  then
    docker build -t raisim-img -f $ROOT_DIR/docker/Dockerfile.nvidiaVulkan $ROOT_DIR \
                                  --network=host \
                                  --build-arg BASE_DIST=ubuntu20.04 \
                                  --build-arg CUDA_VERSION=11.7.1 \
                                  --build-arg VULKAN_SDK_VERSION=`curl https://vulkan.lunarg.com/sdk/latest/linux.txt`
elif [[ $1 = "--nvidia" ]] || [[ $1 = "-n" ]]
  then
  docker build -t raisim-img -f $ROOT_DIR/docker/Dockerfile.nvidiaOpenGL $ROOT_DIR \
                                  --network=host \
                                  --build-arg BASE_DIST=ubuntu20.04 \
                                  --build-arg CUDA_VERSION=11.7.1
else
    echo "[!] If you use nvidia gpu, please rebuild with -n or --nvidia argument"
    docker build -t raisim-img -f $ROOT_DIR/docker/Dockerfile $ROOT_DIR \
                                  --network=host \
                                  # --build-arg from=ubuntu:20.04
fi

cd $EXEC_PATH
