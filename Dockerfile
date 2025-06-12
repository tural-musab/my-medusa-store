FROM node:18-alpine

WORKDIR /app

# Dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Build işlemini yap ve sonucu kontrol et
RUN npm run build && \
    echo "=== Build tamamlandı ===" && \
    ls -la .medusa/server/public/ && \
    echo "=== Admin dosyaları ===" && \
    ls -la .medusa/server/public/admin/

# Port
EXPOSE 9000

# Start
CMD ["npm", "start"]
