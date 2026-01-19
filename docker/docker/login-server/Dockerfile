FROM debian:stable-slim

RUN apt update && \
    apt install -y \
    npm

WORKDIR /opt/lineage2js-login-server

COPY package*.json ./

RUN npm ci --only=production

COPY . .

CMD ["node", "server.js"]
