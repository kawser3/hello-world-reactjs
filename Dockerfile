FROM node:alpine as build

WORKDIR /app

COPY package.json /app

RUN npm install --verbose

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80