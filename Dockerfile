FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Admin olmadan başlat
ENV DISABLE_MEDUSA_ADMIN=true

EXPOSE 9000

CMD ["npm", "start"]
