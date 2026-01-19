FROM node:lts-alpine3.23

WORKDIR /opt/lineage2js-game-server

COPY package*.json ./

RUN npm ci --only=production

COPY . .

CMD ["node", "server.js"]
