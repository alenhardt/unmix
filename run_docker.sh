#!/bin/bash

docker run --shm-size 110G --rm --gpus=all -v .:/host -v /home/alenhardt/src/github.com/DNS-Challenge:/datasets -it --entrypoint /bin/bash pokey909/open-unmix:1.0.0
#docker run --shm-size 110G --rm --gpus=all -v .:/host -v /home/alenhardt/src/github.com/DNS-Challenge:/datasets -it pokey909/open-unmix:1.0.0
