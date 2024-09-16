FROM node:18-alpine
WORKDIR /react-docker-example/
COPY package.json /react-docker-example/
COPY public /react-docker-example/public
COPY src /react-docker-example/src
RUN npm install
CMD [ "npm", "start" ]
