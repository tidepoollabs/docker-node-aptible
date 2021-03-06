FROM node:10
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    curl
    
RUN apt-get -y update && apt-get install -y --no-install-recommends ruby2.3 ruby2.3-dev rubygems-integration

RUN npm install pm2 -g
RUN npm install -g lerna
RUN npm install -g npm-run-all
RUN gem install aptible-cli -v 0.16.5

# RUN npm install -g yarn@1.19.1


ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.8/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=be43e64c45acd6ec4fce5831e03759c89676a0ea

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic
