FROM node:lts-alpine3.23 AS builder

WORKDIR /opt/lineage2js-web-ui

COPY . .

RUN cd web-ui && \
    npm ci --only=production && \
    npm install && \
    npm run build

FROM node:lts-alpine3.23

WORKDIR /opt/lineage2js-web-server

COPY package*.json ./

RUN npm ci --only=production

COPY . .

COPY --from=builder /opt/lineage2js-web-ui/web-ui/dist/ /var/www/html/lineage2js-web-ui/

RUN rm -R web-ui/

CMD ["node", "server.js"]
