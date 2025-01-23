FROM node:20-alpine as build

WORKDIR /app

COPY package*.json ./

RUN  npm install

COPY . .

RUN  npm run build


FROM nginx:alpine

COPY --from=build /app/dist/angular18/browser  /usr/share/nginx/html


CMD [ "nginx","-g","daemon off;" ]


