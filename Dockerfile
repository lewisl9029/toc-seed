FROM node:0.10.40-slim

MAINTAINER Lewis Liu

WORKDIR /toc-seed

COPY telehash-v2 telehash-v2

# Expose telehash seed server port
EXPOSE 42424
EXPOSE 42424/udp

VOLUME /toc-seed/config

CMD [ \
  "node", \
  "telehash-v2/seed.js", \
  "--id /toc-seed/config/id.json", \
  "--seeds /toc-seed/config/seeds.json" \
]
