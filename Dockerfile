#install depedencies
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build 
#above step create /app/build folder from above step and tag to builder
#execure run phase with nginx 
FROM nginx
#copy static file to shared/nginx as per the documentation
COPY --from=builder /app/build  /user/shared/nginx/html 
