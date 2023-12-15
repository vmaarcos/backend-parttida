FROM node:19.3-alpine

WORKDIR /app/parttida-backend

RUN apk update && apk upgrade
RUN apk add git 
RUN apk add bash
RUN apk add yarn 

RUN rm -rf ./node_modules
RUN rm -rf package-lock.json

COPY . /app/parttida-backend

RUN yarn

CMD yarn prisma migrate dev --name init && yarn start