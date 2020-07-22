FROM node:12-alpine

# ENV NPM_CONFIG_LOGLEVEL warn
WORKDIR /app
COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn install --production

COPY . .

RUN yarn build

EXPOSE 3000

CMD yarn start