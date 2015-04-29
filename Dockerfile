
MAINTAINER Lewis Liu

WORKDIR /usr/local

RUN apt-get update \
  && apt-get install -y \
    curl=7.35.0-1ubuntu2.3 \
  && apt-get clean \
  && rm -rf /tmp/* /var/tmp/*

ENV TOC_PACKAGE_HOST https://dl.dropboxusercontent.com/u/172349

ENV TOC_NODE_PACKAGE_NAME node-v0.12.0-linux-x64_v20150210.tar.gz
ADD $TOC_PACKAGE_HOST/$TOC_NODE_PACKAGE_NAME /usr/local/
RUN tar -xzf $TOC_NODE_PACKAGE_NAME && rm $TOC_NODE_PACKAGE_NAME

WORKDIR /toc-seed

ENV TOC_TELEHASH_PACKAGE_NAME telehash-legacy_v20150428.tar.gz
ADD $TOC_PACKAGE_HOST/$TOC_TELEHASH_PACKAGE_NAME /toc-seed/
RUN tar -xzf $TOC_TELEHASH_PACKAGE_NAME && rm $TOC_TELEHASH_PACKAGE_NAME

RUN npm install -g n && npm cache clean
RUN n 0.10.36

# Expose telehash seed server port
EXPOSE 42424

CMD ["node", "seed.js"]

