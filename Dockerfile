FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN yarn install

COPY . .

EXPOSE 9000
CMD sh -c "yarn dev & yarn dev:vendor"
