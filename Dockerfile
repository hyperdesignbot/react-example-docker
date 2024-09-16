FROM node:18-alpine
WORKDIR /react-docker-example/
COPY package.json /react-docker-example/
RUN npm install
RUN npm run build
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
