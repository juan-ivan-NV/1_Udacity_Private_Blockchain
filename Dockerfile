FROM node:16

EXPOSE 8000

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["node", "app.js"]