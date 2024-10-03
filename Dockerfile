FROM node:18-alpine

WORKDIR /app

COPY package*.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn run build:admin && yarn run build:vendor

EXPOSE 9000
CMD sh -c "yarn dev & yarn dev:vendor"
