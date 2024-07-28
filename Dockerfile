FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN chown -R node:node /usr/src/app

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 4000

CMD ["node", "index.js"]
