FROM node:18-alpine

ARG MEDUSA_BACKEND_URL
ARG VITE_BACKEND_URL

ENV MEDUSA_BACKEND_URL=$MEDUSA_BACKEND_URL
ENV VITE_BACKEND_URL=$VITE_BACKEND_URL

WORKDIR /app

COPY package*.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn run build:admin && yarn run build:vendor

EXPOSE 9000 7001 7002

CMD sh -c "yarn dev & yarn dev:vendor"

