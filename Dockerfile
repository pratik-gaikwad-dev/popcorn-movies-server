FROM node:latest

WORKDIR /app

COPY . /app
RUN npm install && \
    npm install pm2 -g

EXPOSE 3000

CMD ["pm2-runtime", "index.js"]