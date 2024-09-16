FROM node:18-alpine
WORKDIR /react-docker-example/
COPY package.json /react-docker-example/
RUN npm install
RUN npm start
