FROM node:18.17.0

WORKDIR /app

COPY package*.json ./

RUN yarn install

COPY . .

EXPOSE 9000

CMD ["yarn", "dev"]
