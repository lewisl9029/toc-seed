FROM node:0.10.40-slim

MAINTAINER Lewis Liu

WORKDIR /toc-seed

COPY telehash-v2 telehash-v2

# Expose telehash seed server port
EXPOSE 42424
EXPOSE 42424/udp

CMD ["node", "telehash-v2/seed.js"]
