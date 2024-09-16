FROM node:18-alpine
WORKDIR /react-docker-example/
COPY package.json /react-docker-example/
RUN npm install
RUN npm run build
# Use Nginx as the production server
FROM nginx:alpine

# Copy the built React app to Nginx's web server directory
COPY --from=build /react-docker-example/build /usr/share/nginx/html

# Expose port 80 for the Nginx server
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
