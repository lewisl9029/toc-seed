FROM node:0.10.40-slim

MAINTAINER Lewis Liu

WORKDIR /toc-seed

COPY telehash-v2 telehash-v2

# Expose telehash seed server port
EXPOSE 42424
EXPOSE 42424/udp

# Use env var TOC_TELEHASH_KEYPAIR to specify keypair
# Use env var TOC_TELEHASH_SEEDS to specify seeds

# Mount this as a volume to generate a new keypair and save it to keypair.json
VOLUME /toc-seed/config
CMD [ "node", "telehash-v2/seed.js --id /toc-seed/config/keypair.json" ]
