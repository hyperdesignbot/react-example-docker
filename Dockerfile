FROM node:18-alpine
WORKDIR /react-docker-example/
CMD ["npm", "start"]
COPY package.json /react-docker-example/
RUN npm install
COPY src/ /react-docker-example/src
COPY public/ /react-docker-example/public

