FROM node:fermium-alpine

WORKDIR /indexer

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

CMD ["yarn", "start"]