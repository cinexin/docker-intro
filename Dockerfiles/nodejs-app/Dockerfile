FROM node:current-alpine3.10
EXPOSE 3000
RUN apk add --update tini
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json .
RUN npm install && npm cache clean --force
COPY bin bin/
COPY public public/
COPY routes routes/
COPY views views/
COPY app.js .
CMD ["/sbin/tini", "--", "node", "./bin/www"]