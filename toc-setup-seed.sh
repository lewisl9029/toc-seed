#!/usr/bin/env bash
sudo docker run -d \
  --name toc-seed --restart always \
  -v /home/toc/toc-seed/config:/toc-seed/config \
  -p 443:42424 \
  -p 443:42424/udp \
  lewisl9029/toc-seed
